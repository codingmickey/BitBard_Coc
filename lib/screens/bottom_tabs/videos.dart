import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trinity/screens/bottom_tabs/video_player.dart';
// import 'package:trinity/screens/video_player.dart';
import 'package:video_player/video_player.dart';

class Videos extends StatefulWidget {
  const Videos({super.key});

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  // var _razorpay = Razorpay();
  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    List<Widget> reel = [
      VideoScreen(
          url:
              "https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/tomp3.cc%20-%20Indian%20National%20Parks%20%20greengaurdians%20%20ranadagupathi%20%20shorts%20%20discoverychannelindia_720p.mp4?alt=media&token=6e319d70-1aea-45e1-a07a-02d04ecdb7ed"),
      VideoScreen(
          url:
              "https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/Top%2010%20Beautiful%20Beaches%20in%20India%20%F0%9F%87%AE%F0%9F%87%B3%20_%20%23shorts%20_%23beach.mp4?alt=media&token=bfca5e1e-e765-4180-bd10-f4b76cb4728b"),
      VideoScreen(
          url:
              "https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/QUTUB%20MINAR%2C%20DELHI%E2%80%99S%20FAMOUS%20MONUMENT!!!%F0%9F%87%AE%F0%9F%87%B3%20%23india%20%23delhi.mp4?alt=media&token=abf8e786-3491-4c49-9190-baf0d3f5842a"),
      VideoScreen(
          url:
              "https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/Top%2010%20magnificent%20Rock-%20cut%20caves%20in%20India%20__%20%F0%9F%98%B2%20%23shorts%20%23viral.mp4?alt=media&token=5375ef96-de26-491f-9237-b945c12286b0"),
      VideoScreen(
          url:
              "https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/tomp3.cc%20-%20Treks%20in%20India%20travelling%20instagram%20reels%20shorts%20trending%20trekking%20north%20india%20love%20uk_720p.mp4?alt=media&token=a058b3f3-c810-4699-87e0-51dee1ad8574"),
    ];
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      children: reel,
    );
  }
}
