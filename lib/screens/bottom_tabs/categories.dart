import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trinity/screens/panorama.dart';
import 'package:trinity/screens/places.dart';
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
      "assets/images/baga_beach.jpg",
      "assets/images/himalaya.jpg",
      "assets/images/kedarnath.jpg",
      "assets/images/meseum.jpg"
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

    List<String> placeName = ["Baga Beach Goa", "Indian Meuseum", "Hiking", "Hill Station"];

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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => PanoramaView(
                                        image: i,
                                        placeName: placeName[idx],
                                      ))));
                        },
                        child: Container(
                            // height: 100,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            // padding: EdgeInsets.all(15.0),
                            alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("${i}"), fit: BoxFit.cover),
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
                                placeName[idx],
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => PlacesScreen(
                                    category: "Hill Stations",
                                  ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              "assets/images/hillstation.jpg",
                            ),
                          ),
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
                          color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20), child: Image.asset("assets/images/beaches.jpg")),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Beaches',
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
                      //               category: "environment",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset("assets/images/monuments.jpg")),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Historic',
                            textAlign: TextAlign.center,
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
                      //               category: "food",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/religious.jpg",
                              height: 70,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Religious',
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
                      //               category: "health",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/hiking.jpg",
                                height: 70,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Hiking',
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
                      //               category: "politics",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset("assets/images/historic.jpg")),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Monuments',
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
                      //               category: "science",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/caves.jpg",
                                height: 70,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Caves',
                            textAlign: TextAlign.center,
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
                      //               category: "sports",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/lakes.jpg",
                              height: 70,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Lakes',
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
                      //               category: "technology",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/meseum.jpg",
                              height: 70,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Museums',
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
                      //               category: "top",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/parks.jpg",
                              // height: 75,
                              // width: 150,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Parks',
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
                      //               category: "world",
                      //             ))));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/waterfall.jpg",
                              height: 70,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Waterfalls',
                            style: TextStyle(color: ktealColor, fontWeight: FontWeight.bold),
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
