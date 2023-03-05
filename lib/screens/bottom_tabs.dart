import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trinity/screens/bottom_tabs/bluetooth.dart';
import 'package:trinity/screens/bottom_tabs/categories.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:trinity/screens/bottom_tabs/chatbot.dart';
import 'package:trinity/screens/bottom_tabs/connected_users.dart';
import 'package:trinity/screens/bottom_tabs/map.dart';
import 'package:trinity/screens/bottom_tabs/videos.dart';

// import 'package:progr "
// import 'package:trinity/screens/bottom_tabs/categories.dart';
import 'package:trinity/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? activeIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      activeIndex = 0;
    });
    // initializeLocation();
  }

  Widget getTab() {
    if (activeIndex == 0) return CatergoriesScreen();
    if (activeIndex == 1) return Videos();
    if (activeIndex == 2) return BluetoothScreen();
    // return MapScreen(
    //   latitude: latitude!,
    //   longitude: longitude!,
    // );
    if (activeIndex == 3) return ConnectedUsers();

    return ChatBotWidget(
      profileUrl:
          'https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/WhatsApp%20Image%202023-03-04%20at%2017.30.53.jpeg?alt=media&token=3506f92d-0c5d-4812-820f-5ce4688c4bfa',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          color: Colors.teal,
          backgroundColor: kBackgroundColor,
          items: const [
            Icon(
              Icons.home,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.video_call,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              FontAwesomeIcons.earthAfrica,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.add_circle,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.account_box,
              size: 24,
              color: Colors.white,
            )
          ],
          onTap: (index) {
            setState(() {
              activeIndex = index;
            });
          },
        ),
        body: Container(
          child: getTab(),
        ));
  }
}
