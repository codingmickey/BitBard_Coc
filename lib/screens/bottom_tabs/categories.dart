import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trinity/utils/constants.dart';

class CatergoriesScreen extends StatefulWidget {
  const CatergoriesScreen({super.key});

  @override
  State<CatergoriesScreen> createState() => _CatergoriesScreenState();
}

class _CatergoriesScreenState extends State<CatergoriesScreen> {
  @override
  Widget build(BuildContext context) {
    String _selectedValue = "Hill Station";

    var placesBanner = [
      "https://media.istockphoto.com/id/1360554439/photo/maldives-tropical-island.jpg?b=1&s=170667a&w=0&k=20&c=AWY54kmUT9IcXJZdSdxxm5JUFK_3fxpmMbWQ6IhEG50=",
      "https://media.istockphoto.com/id/475836292/photo/clouds-rolling-between-hills-of-himachal.jpg?s=612x612&w=0&k=20&c=orTwGIhfXYnJPMpnkq70AL5IQPSLj0XeLVgn-EjjdyM=",
      "https://images.unsplash.com/photo-1551632811-561732d1e306?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aGlraW5nfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
      "https://upload.wikimedia.org/wikipedia/commons/8/8c/Indian_Museum%2C_Courtyard%2C_Kolkata%2C_India.jpg"
    ];

    List<String> _values = [
      'Hill Station',
      'Beaches',
      'Historic Places',
      'Religious Places',
      "Hiking",
      "Monuments",
      "Caves and Caverns",
      "Lakes",
      "Museums",
      "Parks",
      "Waterfalls",
    ];

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 170,
                  viewportFraction: 0.8,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                ),
                items: placesBanner.map((i) {
                  int idx = placesBanner.indexOf(i);
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          // _launchUrl(youtube_urls[idx]);
                        },
                        child: Container(
                            // height: 100,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            // padding: EdgeInsets.all(15.0),
                            alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage("${i}"), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                              child: Text(
                                'idx',
                                style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w500),
                              ),
                            )),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Places to Travel!",
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 500,
              child: GridView.count(
                primary: false,
                // padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => Home(
                      //               category: "business",
                      //             ))));
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(color: kwhiteColor, borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset("assets/illustrations/business.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Hill Station',
                            style: TextStyle(color: ktealColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => Home(
                      //               category: "entertainment",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF565656).withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset("assets/illustrations/entertainment.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Beaches',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => Home(
                      //               category: "environment",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF565656).withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset("assets/illustrations/environment.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Historic Places',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => Home(
                      //               category: "food",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF565656).withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset("assets/illustrations/food.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Religious Places',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => Home(
                      //               category: "health",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF565656).withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset("assets/illustrations/health.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Hiking',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => Home(
                      //               category: "politics",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF565656).withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset("assets/illustrations/politics.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Monuments',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => Home(
                      //               category: "science",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF565656).withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset("assets/illustrations/science.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Caves and Caverns',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => Home(
                      //               category: "sports",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF565656).withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/illustrations/sports.png",
                            height: 75,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Lakes',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => Home(
                      //               category: "technology",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF565656).withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/illustrations/technology.png",
                            height: 75,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Museums',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => Home(
                      //               category: "top",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF565656).withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/illustrations/top.png",
                            height: 75,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Parks',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => Home(
                      //               category: "world",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF565656).withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/illustrations/world.png",
                            height: 75,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Waterfalls',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Container(
                  //   padding: const EdgeInsets.all(8),
                  //   color: Color(0xFF565656),
                  //   child: Image.asset("assets/illustrations/business.png"),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.all(8),
                  //   color: Color(0xFF565656),
                  //   child: const Text('Sound of screams but the'),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.all(8),
                  //   color: Color(0xFF565656),
                  //   child: const Text('Who scream'),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.all(8),
                  //   color: Color(0xFF565656),
                  //   child: const Text('Revolution is coming...'),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.all(8),
                  //   color: Color(0xFF565656),
                  //   child: const Text('Revolution, they...'),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
