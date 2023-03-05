import 'package:flutter/material.dart';
import 'package:trinity/utils/constants.dart';

class TwoPersonChat extends StatefulWidget {
  const TwoPersonChat({Key? key, required this.name, required this.lastMessage}) : super(key: key);
  final String name;
  final String lastMessage;
  @override
  _TwoPersonChatState createState() => _TwoPersonChatState();
}

class _TwoPersonChatState extends State<TwoPersonChat> {
  // Define a list of ChatMessage widgets to represent the chat history
  // String lastMessage = widget.lastMessage;
  final List<ChatMessage> _messages = [
    ChatMessage(text: 'How are you?', isMe: false),
    ChatMessage(text: 'Hi there!', isMe: true),
    // ChatMessage(text: '${widget.lastMessage}', isMe: false),
  ];
  @override
  void initState() {
    // TODO: implement initState
    _messages.insert(0, ChatMessage(text: '${widget.lastMessage}', isMe: false));
    super.initState();
  }

  // Define a TextEditingController to handle user input
  final TextEditingController _textController = TextEditingController();

  // Define a method to handle message submission
  void _handleSubmitted(String text) {
    // Create a new ChatMessage widget with the submitted text and add it to the list
    ChatMessage message = ChatMessage(text: text, isMe: true);
    setState(() {
      _messages.insert(0, message);
    });
    // Clear the text input field after submitting the message
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ktealColor,
        title: Text('${widget.name}'),
      ),
      body: Column(
        children: [
          // Use an Expanded widget to make the message list fill up the remaining space
          Expanded(
            child: ListView.builder(
              // Reverse the order of the messages so that the most recent one is at the bottom
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _messages[index];
              },
            ),
          ),
          // Use a container with a TextField and an IconButton to allow the user to send messages
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.grey[300],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: "Text a message",
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// This is a simple widget that displays a chat message
class ChatMessage extends StatelessWidget {
  final String text;
  final bool isMe;

  ChatMessage({required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final messageAlign = isMe ? MainAxisAlignment.end : MainAxisAlignment.start;
    final messageContainerDecoration = isMe
        ? BoxDecoration(
            color: ktealColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          )
        : BoxDecoration(
            color: kwhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          );
    final messageTextStyle = TextStyle(
      color: isMe ? Colors.white : Colors.grey.shade700,
      fontSize: 16.0,
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: messageAlign,
        children: [
          // Display the message in a container with a rounded border
          Container(
            decoration: messageContainerDecoration,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: messageTextStyle),
              ],
            ),
          ),
          // Display the user's avatar on the opposite side of the message
        ],
      ),
    );
  }
}
