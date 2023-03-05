import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trinity/screens/bottom_tabs/map.dart';
import 'package:trinity/screens/group_chat.dart';
import 'package:trinity/utils/constants.dart';

class ConnectedUsers extends StatefulWidget {
  const ConnectedUsers({super.key});

  @override
  State<ConnectedUsers> createState() => _ConnectedUsersState();
}

class _ConnectedUsersState extends State<ConnectedUsers> {
  List<String> profileImag = [
    "https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/WhatsApp%20Image%202023-03-04%20at%2017.26.13.jpeg?alt=media&token=bc88699a-2007-4223-8aee-14880bdadfbf",
    "https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/WhatsApp%20Image%202023-03-04%20at%2017.30.53.jpeg?alt=media&token=3506f92d-0c5d-4812-820f-5ce4688c4bfa",
    "https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/WhatsApp%20Image%202023-03-05%20at%2002.56.55.jpeg?alt=media&token=514a0a44-4ed3-4fed-8b81-d24e3520f6ab"
  ];
  List<String> names = ["Jay Jain", "Arihant Sheth", "Atharva Salian"];
  List<String> messages = ["Let's meet at this place", "I am Hardik Gupta", "That's great"];
  bool _isLoading = true;
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        // FloatingActionButton(
        //   elevation: 1,
        //   backgroundColor: Colors.transparent,
        //   onPressed: () {
        //     // Share.share(widget.url);
        //     // Future.delayed(Duration(seconds: 2), () {
        //     //   flutterLocalNotificationsPlugin.show(
        //     //       1,
        //     //       "SSR's murderer found",
        //     //       "Politician on the run after warrant declared against his name.Fans ask for his head",
        //     //       NotificationDetails(
        //     //           android: AndroidNotificationDetails(
        //     //         channel.id,
        //     //         channel.name,
        //     //         channelDescription: channel.description,
        //     //         sound: channel.sound,
        //     //       )));
        //     //   // setState(() {
        //     //   //   newNews = true;
        //     //   // });
        //     // });
        //   },
        //   child: Icon(
        //     Icons.add,
        //     color: Colors.white,
        //     size: 30,
        //   ),
        // ),
        // SizedBox(
        //   height: 30,
        // ),
        FloatingActionButton(
          elevation: 1,
          backgroundColor: Colors.teal.withOpacity(0.3),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MapScreen(
                latitude: 19.107644430596093,
                longitude: 72.83717816852801,
              );
            }));
          },
          child: Icon(
            Icons.location_on,
            color: kwhiteColor,
            size: 40,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        FloatingActionButton(
          elevation: 1,
          backgroundColor: Colors.teal.withOpacity(0.3),
          onPressed: () {
            // Share.share(widget.url);
          },
          child: Icon(
            Icons.share,
            color: Colors.white,
          ),
        ),
      ]),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Your Wander Matches!!",
                style: TextStyle(color: ktealColor, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MapScreen(
                      latitude: 19.107644430596093,
                      longitude: 72.83717816852801,
                    );
                  }));
                },
                child: Icon(
                  Icons.location_on,
                  color: ktealColor,
                  size: 40,
                ),
              ),
            ),
            _isLoading
                ? CircularProgressIndicator()
                : ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 1.5,
                        color: Colors.grey[300],
                      );
                    },
                    itemCount: names.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10, top: 20),
                        child: Row(
                          children: [
                            // Profile Image
                            CircleAvatar(
                              radius: 40.0,
                              backgroundImage: NetworkImage(profileImag[index]),
                            ),
                            // Name and Interests Column
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Name Text Widget
                                    Text(
                                      names[index],
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.reply,
                                          color: Colors.grey[500],
                                        ),
                                        Text(
                                          messages[index],
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 15.0,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Interests Text Widget

                                    // RichText(
                                    //     text: TextSpan(children: [
                                    //   TextSpan(
                                    //     text: 'Interests: ',
                                    //     style: TextStyle(
                                    //       color: ktealColor,
                                    //       fontFamily: "Montserrat",
                                    //       fontSize: 14.0,
                                    //       fontWeight: FontWeight.bold,
                                    //     ),
                                    //   ),
                                    //   TextSpan(
                                    //     text: interests[index],
                                    //     style: TextStyle(
                                    //       fontSize: 14.0,
                                    //       color: Colors.grey[600],
                                    //     ),
                                    //   ),
                                    // ])),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return TwoPersonChat(name: names[index], lastMessage: messages[index]);
                                          }));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                            color: ktealColor.withOpacity(0.8),
                                          ),
                                          height: 30,
                                          width: 150,
                                          child: Center(
                                            child: Text(
                                              "Chat with him",
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // color: ktealColor,
                        // height: 20,
                        // width: 20,
                      );
                    }),
          ],
        ),
      ),
    );
  }
}
