import 'dart:developer';
import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:employee_forums/models/chatbot/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:intl/intl.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

// import '../../../resources/r.dart';
// import '../submodules/feed/feed_module.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:trinity/models/messages.dart';
import 'package:trinity/utils/constants.dart';
import 'package:trinity/utils/r.dart';

class ChatBotWidget extends StatefulWidget {
  const ChatBotWidget({super.key, required this.profileUrl});

  static String get linkRoute => "/chatbot";
  // static String get toRoute => "${FeedModule.moduleRoute}$linkRoute";

  final String profileUrl;

  @override
  State<ChatBotWidget> createState() => _ChatBotWidgetState();
}

enum TtsState { playing, stopped, paused, continued }

class _ChatBotWidgetState extends State<ChatBotWidget> {
  bool isTyping = false,
      isBotResponding = false,
      isWaiting = false,
      isRecording = false,
      isSpeaking = true,
      isLast = false,
      wasSpeaking = false,
      setDate = true,
      firstSpeak = true,
      speechReady = false;

  late FlutterTts textToSpeech;
  double volume = 1;
  double rate = 0.5;
  double pitch = 1.0;

  TtsState ttsState = TtsState.stopped;
  SpeechToText speechToText = SpeechToText();

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  late TextEditingController textEditingController;
  late FocusNode focusNode;
  late ScrollController scrollController;

  final openAI = OpenAI.instance.build(
    token: "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",
    baseOption: HttpSetup(receiveTimeout: 6000),
    isLogger: true,
  );

  List<ChatBotMessages> chats = [
    ChatBotMessages("Hi, how can I help you?", DateTime.now(), true),
  ];

  @override
  void initState() {
    isRecording = false;
    textToSpeech = FlutterTts();
    initTts();
    initSpeech();
    textEditingController = TextEditingController();
    scrollController = ScrollController();
    focusNode = FocusNode();
    focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    // textToSpeech.stop();
    speechToText.stop();
    textEditingController.dispose();
    scrollController.dispose();
    focusNode.unfocus();
    focusNode.dispose();
    super.dispose();
  }

  void addChat(String message, bool isBot) {
    if (mounted)
      setState(() {
        setDate = true;
        if (isBot) isBotResponding = true;
        chats.add(ChatBotMessages(message.trim(), DateTime.now(), isBot));
      });
    print("Was speaking: " + wasSpeaking.toString());
    if (isBot && wasSpeaking) {
      speak(message);
      wasSpeaking = false;
    }
    if (isBot) scrollDown();
    if (!isBot)
      Future.delayed(
        Duration(milliseconds: 100),
        () => scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
        ),
      );
  }

  void botFinished() {
    isBotResponding = false;
  }

  void scrollDown() {
    Future.doWhile(() async {
      print("Scrolling called");
      await Future.delayed(
        Duration(milliseconds: 100),
        () => scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
        ),
      );
      return isBotResponding;
    });
  }

  Future<void> getResponse(String text) async {
    final request = CompleteText(
      prompt: text,
      maxTokens: 200,
      model: kTranslateModelV3,
    );

    final response = await openAI.onCompleteText(request: request).onError((error, stackTrace) {
      print(error);
      addChat(
          "Day 1:\nBreakfast at Café Bodega in Panaji.\nVisit the Basilica of Bom Jesus and Se Cathedral in Old Goa.\nLunch at Vinayak Family Restaurant in Panaji.\nVisit the Fontainhas neighborhood in Panaji.\nSpend the rest of the day at Baga Beach.\nDay 2:\nVisit Fort Aguada for views of the Arabian Sea.\nBrowse Anjuna Flea Market.\nLunch at Gunpowder restaurant in Assagao.\nSpend the afternoon at Palolem Beach.\nWatch fire dancers at Arambol Beach at sunset.\nDinner at Mum's Kitchen in Panaji",
          true);
      if (mounted)
        setState(() {
          setDate = true;
          isWaiting = false;
        });
      return null;
    });

    if (response != null) addChat(response.choices[0].text.trimLeft(), true);

    if (mounted)
      setState(() {
        setDate = true;
        isWaiting = false;
      });
  }

  // TTS ---------------------------------------------------------------- START

  Future speak(String text) async {
    if (isSpeaking) {
      await textToSpeech.setVolume(volume);
      await textToSpeech.setSpeechRate(rate);
      await textToSpeech.setPitch(pitch);
      await textToSpeech.speak(text);
    }
  }

  Future soundOn(String message, bool isSpeaking) async {
    if (this.isSpeaking != isSpeaking) {
      if (mounted)
        setState(() {
          setDate = true;
          this.isSpeaking = isSpeaking;
        });
      if (!isSpeaking) {
        await textToSpeech.stop();
      } else if (!isPlaying) {
        speak(message);
      }
    }
  }

  initTts() {
    textToSpeech = FlutterTts();

    setAwaitOptions();

    if (isAndroid) {
      getDefaultEngine();
      getDefaultVoice();
    }
  }

  Future setAwaitOptions() async {
    await textToSpeech.awaitSpeakCompletion(true);
  }

  Future getDefaultEngine() async {
    var engine = await textToSpeech.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future getDefaultVoice() async {
    var voice = await textToSpeech.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

  // TTS ------------------------------------------------------------------ END

  // STT ---------------------------------------------------------------- START

  void initSpeech() async {
    speechReady = await speechToText.initialize(onStatus: (status) => statusListener(status));
    if (mounted)
      setState(() {
        setDate = true;
      });
  }

  void statusListener(String status) {
    log("Current status: $status");
    if (status == "listening") {
      if (mounted)
        setState(() {
          setDate = true;
          isRecording = true;
          textEditingController.clear();
        });
    } else if (status == "notListening") {
      Future.delayed(Duration(milliseconds: 500), () {
        if (mounted)
          setState(() {
            setDate = true;
            isRecording = false;
            print("Yes");
            wasSpeaking = true;
            if (textEditingController.text.isNotEmpty) isTyping = true;
          });
      });
    }
  }

  void startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
  }

  void stopListening() async {
    await speechToText.stop();
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    if (result.recognizedWords.isNotEmpty) if (mounted)
      setState(() {
        setDate = true;
        textEditingController.text = result.recognizedWords;
        textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length),
        );
      });
  }

  // STT ------------------------------------------------------------------ END

  @override
  Widget build(BuildContext context) {
    if (firstSpeak) {
      speak("Hi, how can I help you?");
      firstSpeak = false;
    }
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: ktealColor,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: SvgPicture.asset(
        //     'assets/icons/app_icons/arrow_back.svg',
        //     color: Theme.of(context).brightness == Brightness.light ? R.colors.darkGrey : R.darkColors.blackshade50,
        //     height: 30,
        //   ),
        // ),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: kwhiteColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/images/chat_bot.svg",
                  width: 24,
                  height: 24,
                  fit: BoxFit.scaleDown,
                  color: ktealColor,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text("Bot",
                style: TextStyle(
                  color: kwhiteColor,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    ...List.generate(
                      chats.length,
                      (index) {
                        if (index > 0 &&
                            chats[index].time.day != chats[index - 1].time.day &&
                            chats[index].time.isAfter(chats[index - 1].time)) {
                          setDate = true;
                        } else if (index > 0) {
                          setDate = false;
                        }
                        return chats[index].isBot
                            ? BotMessage(
                                chatBotMessages: chats[index],
                                setDate: setDate,
                                isSpeaking: isSpeaking,
                                isLast: index == chats.length - 1,
                                soundOn: soundOn,
                                botFinished: botFinished,
                              )
                            : UserMessage(
                                chatBotMessages: chats[index],
                                setDate: setDate,
                                profileUrl: widget.profileUrl,
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isWaiting) SizedBox(height: 15),
          if (isWaiting)
            SpinKitThreeBounce(
              size: 20,
              color: Theme.of(context).brightness == Brightness.light ? R.darkColors.tertiary100 : R.colors.white,
            ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color:
                          Theme.of(context).brightness == Brightness.light ? R.colors.white : R.darkColors.tertiary100,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                          color: Theme.of(context).brightness == Brightness.light
                              ? R.colors.grey
                              : R.darkColors.tertiary20)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      cursorColor: R.colors.webBlue,
                      onChanged: (value) {
                        if (textEditingController.text.isNotEmpty) {
                          if (mounted)
                            setState(() {
                              setDate = true;
                              if (!isRecording) {
                                isTyping = true;
                              }
                            });
                        } else {
                          if (mounted)
                            setState(() {
                              setDate = true;
                              isTyping = false;
                            });
                        }
                      },
                      keyboardType: TextInputType.multiline,
                      controller: textEditingController,
                      focusNode: focusNode,
                      maxLines: 3,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText: "Ask anything...",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          color: R.colors.midGrey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              if (isTyping)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      if (textEditingController.text.isNotEmpty) {
                        if (mounted)
                          setState(() {
                            setDate = true;
                            isWaiting = true;
                          });
                        addChat(textEditingController.text, false);
                        getResponse(textEditingController.text.trim());
                        textEditingController.clear();
                        if (mounted)
                          setState(() {
                            setDate = true;
                            isTyping = false;
                          });
                      }
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: R.colors.webBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.send,
                          size: 20,
                          color: R.colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              if (!isTyping)
                AvatarGlow(
                  endRadius: 40,
                  glowColor: ktealColor,
                  child: GestureDetector(
                    onTapDown: (details) {
                      if (speechReady) {
                        startListening();
                      }
                    },
                    onTapUp: (details) {
                      if (speechReady) {
                        stopListening();
                      }
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isRecording ? R.colors.webBlue : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.mic_none_rounded,
                          color: Theme.of(context).brightness == Brightness.light
                              ? !speechReady
                                  ? R.colors.darkGrey
                                  : isRecording
                                      ? R.colors.white
                                      : R.darkColors.tertiary100
                              : !speechReady
                                  ? R.colors.darkGrey
                                  : R.colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          // Text(
          //   "Powered by ChatGPT",
          //   style: TextStyle(
          //     fontSize: 12,
          //     fontFamily: 'Nunito',
          //     color: Theme.of(context).brightness == Brightness.light ? R.colors.darkGrey : R.colors.darkGrey,
          //   ),
          // ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class UserMessage extends StatelessWidget {
  const UserMessage({
    Key? key,
    required this.chatBotMessages,
    required this.setDate,
    required this.profileUrl,
  }) : super(key: key);
  final ChatBotMessages chatBotMessages;
  final bool setDate;
  final String profileUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (setDate)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  height: 1,
                  color:
                      Theme.of(context).brightness == Brightness.light ? R.darkColors.tertiary500 : R.colors.darkGrey,
                ),
              ),
              SizedBox(width: 20),
              Text(
                chatBotMessages.time.difference(DateTime.now()).inDays == 0
                    ? "Today"
                    : DateFormat("dd MMMM yyyy").format(chatBotMessages.time),
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Nunito",
                  color: Theme.of(context).brightness == Brightness.light ? R.darkColors.tertiary500 : R.colors.midGrey,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Divider(
                  height: 1,
                  color:
                      Theme.of(context).brightness == Brightness.light ? R.darkColors.tertiary100 : R.colors.darkGrey,
                ),
              ),
            ],
          ),
        if (setDate) SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).brightness == Brightness.light ? R.colors.lightBlue4 : R.colors.lightBlue3,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        chatBotMessages.message,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Nunito",
                          color: R.colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    DateFormat.jm().format(chatBotMessages.time).toLowerCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Nunito',
                      color: Theme.of(context).brightness == Brightness.light
                          ? R.colors.darkGrey
                          : R.darkColors.blackshade50,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: CachedNetworkImage(
                  imageUrl: profileUrl,
                  width: 35,
                  height: 35,
                  errorWidget: (context, error, dy) => SvgPicture.asset(
                    Theme.of(context).brightness == Brightness.light
                        ? "assets/icons/app_icons/default_profile_pic.svg"
                        : "assets/icons/app_icons/default_profile_pic_dark.svg",
                    width: 35,
                    height: 35,
                  ),
                ),
              ),
              // Container(
              //   width: 35,
              //   height: 35,
              //   decoration: BoxDecoration(
              //     color: Theme.of(context).brightness == Brightness.light
              //         ? R.colors.botGrey
              //         : R.colors.darkGrey,
              //     shape: BoxShape.circle,
              //   ),
              //   child: Center(
              //     child: SvgPicture.asset(
              //       "assets/icons/feed_icons/chat_bot.svg",
              //       width: 20,
              //       height: 20,
              //       fit: BoxFit.scaleDown,
              //       color: Theme.of(context).brightness == Brightness.light
              //           ? R.colors.darkGrey
              //           : R.darkColors.blackshade50,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class BotMessage extends StatelessWidget {
  const BotMessage({
    Key? key,
    required this.chatBotMessages,
    required this.setDate,
    required this.isSpeaking,
    required this.soundOn,
    required this.isLast,
    required this.botFinished,
  }) : super(key: key);
  final ChatBotMessages chatBotMessages;
  final bool setDate, isSpeaking, isLast;
  final Function soundOn, botFinished;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (setDate)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  height: 1,
                  color: Theme.of(context).brightness == Brightness.light ? R.colors.thinGrey : R.colors.darkGrey,
                ),
              ),
              SizedBox(width: 20),
              Text(
                chatBotMessages.time.difference(DateTime.now()).inDays == 0
                    ? "Today"
                    : DateFormat("dd MMMM yyyy").format(chatBotMessages.time),
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Nunito",
                  color: Theme.of(context).brightness == Brightness.light ? R.colors.darkGrey : R.colors.midGrey,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Divider(
                  height: 1,
                  color: Theme.of(context).brightness == Brightness.light ? R.colors.thinGrey : R.colors.darkGrey,
                ),
              ),
            ],
          ),
        if (setDate) SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: kwhiteColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/chat_bot.svg",
                    width: 20,
                    height: 20,
                    fit: BoxFit.scaleDown,
                    color: ktealColor,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light ? R.colors.lightGrey3 : R.colors.darkGrey,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        onFinished: () {
                          print("Finished!");
                          botFinished();
                        },
                        animatedTexts: [
                          TyperAnimatedText(
                            chatBotMessages.message,
                            speed: const Duration(milliseconds: 50),
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: "Nunito",
                              color: Theme.of(context).brightness == Brightness.light ? R.colors.black : R.colors.white,
                            ),
                          ),
                        ],
                        // child: Text(
                        //   chatBotMessages.message,
                        //   style: TextStyle(
                        //     fontSize: 14,
                        //     fontFamily: "Nunito",
                        //     color: R.colors.white,
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    DateFormat.jm().format(chatBotMessages.time).toLowerCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Nunito',
                      color: Theme.of(context).brightness == Brightness.light
                          ? R.colors.chatGrey
                          : R.darkColors.tertiary550,
                    ),
                  ),
                ],
              ),
              if (isLast)
                GestureDetector(
                  onTap: () {
                    soundOn(chatBotMessages.message, !isSpeaking);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        isSpeaking ? Icons.volume_up : Icons.volume_off,
                        color: Theme.of(context).brightness == Brightness.light
                            ? R.colors.darkGrey
                            : R.darkColors.blackshade50,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
