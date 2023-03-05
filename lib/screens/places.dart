import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:trinity/screens/form_screen.dart';
import 'package:trinity/utils/constants.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key, required this.category});
  final String category;
  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  bool _isLoading = true;
  final controller = SwipableStackController();

  var data = [
    {
      "title": "Manali",
      "image": "https://himachaltourism.gov.in/wp-content/uploads/2019/04/Solang-Valley-Manali.jpg",
      "description":
          "Nestled in the mountains of Himachal Pradesh, Manali is a picturesque hill station that is renowned for its breathtaking natural beauty and thrilling adventure sports. Surrounded by towering snow-capped peaks, lush green forests, and meandering rivers, Manali is the perfect destination for nature lovers and adventure enthusiasts alike.",
      "itineraryRoute": "Delhi - Manali - Delhi",
      "itineraryDates": "May 1-3, 2023",
      "itineraryPrice": "12000",
      "itineraryPreferences": "Adventure, Nature, Culture",
      "leaderName": "Rajesh Sharma"
    },
    {
      "title": "Darjeeling",
      "image":
          "https://img.traveltriangle.com/blog/wp-content/uploads/2020/01/og-Things-to-do-in-Darjeeling_14th-jan.jpg",
      "description":
          "Located in the northeastern state of West Bengal, Darjeeling is a charming hill station that is renowned for its scenic beauty, tea plantations, and heritage toy train. With its cool climate, stunning views of the Himalayas, and lush greenery, Darjeeling is a popular destination among tourists seeking relaxation and rejuvenation. Visitors can explore the town's rich history and culture, visit the famous tea estates.",
      "itineraryRoute": "Kolkata - Darjeeling - Kolkata",
      "itineraryDates": "June 15-18, 2023",
      "itineraryPrice": "15000",
      "itineraryPreferences": "Nature, Adventure, Food",
      "leaderName": "Sudhir Roy"
    },
    {
      "title": "Munnar",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Munnar_hillstation_kerala.jpg/1200px-Munnar_hillstation_kerala.jpg",
      "description":
          "Located in the Western Ghats of Kerala, Munnar is a stunning hill station that is famous for its tea and spice plantations, rolling hills, and misty valleys. Surrounded by lush greenery and meandering streams, Munnar is the perfect destination for nature lovers and wildlife enthusiasts.",
      "itineraryRoute": "Kochi - Munnar - Kochi",
      "itineraryDates": "September 10-12, 2023",
      "itineraryPrice": "9000",
      "itineraryPreferences": "Nature, Wildlife, Relaxation",
      "leaderName": "Anita Menon"
    },
    {
      "title": "Shimla",
      "image": "https://resize.indiatvnews.com/en/resize/newbucket/715_-/2020/12/pti28-12-2020-000048b-1609160104.jpg",
      "description":
          "Located in the state of Himachal Pradesh, Shimla is a charming hill station that is renowned for its colonial architecture, apple orchards, and stunning views of the surrounding mountains. With its cool climate, scenic beauty, and rich cultural heritage, Shimla is a popular destination among tourists seeking relaxation and adventure.",
      "itineraryRoute": "Delhi - Shimla - Delhi",
      "itineraryDates": "November 25-27, 2023",
      "itineraryPrice": "11000",
      "itineraryPreferences": "History, Adventure, Food",
      "leaderName": "Vikas Singh"
    },
    {
      "title": "Ooty",
      "image":
          "https://www.tamilnadutourism.tn.gov.in/img/pages/large-desktop/ooty-1655457424_bca80f81e8391ebdaaca.webp",
      "description":
          "Located in the Nilgiri hills of Tamil Nadu, Ooty is a popular hill station that is renowned for its lush greenery, rolling hills, and cool weather. Surrounded by meandering rivers, cascading waterfalls, and sprawling tea plantations, Ooty is the perfect destination for nature lovers and relaxation seekers.",
      "itineraryRoute": "Bangalore - Ooty - Bangalore",
      "itineraryDates": "December 20-23, 2023",
      "itineraryPrice": "8000",
      "itineraryPreferences": "Nature, Relaxation, Food",
      "leaderName": "Neha Gupta"
    },
    {
      "title": "Munnar",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Munnar_hillstation_kerala.jpg/1200px-Munnar_hillstation_kerala.jpg",
      "description":
          "Located in the Western Ghats of Kerala, Munnar is a stunning hill station that is famous for its tea and spice plantations, rolling hills, and misty valleys. Surrounded by lush greenery and meandering streams, Munnar is the perfect destination for nature lovers and wildlife enthusiasts.",
      "itineraryRoute": "Kochi - Munnar - Kochi",
      "itineraryDates": "September 10-12, 2023",
      "itineraryPrice": "9000",
      "itineraryPreferences": "Nature, Wildlife, Relaxation",
      "leaderName": "Anita Menon"
    },
  ];

  List<String> profileImages = [
    'https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/19.jpg?alt=media&token=ef0b61f1-b2e5-48bf-b3ef-14235b768d4c',
    'https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/3.jpg?alt=media&token=98956cdb-16b4-4ebe-8047-b5b1ac64f258',
    'https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/31.jpg?alt=media&token=fd5e3496-c5b4-4876-9579-2b4b7c6bcdbe',
    'https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/43.jpg?alt=media&token=08f5c9ff-089f-48f2-928f-9f1240ec3efe',
    // 'https://example.com/profile3.jpg',
  ];

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        !_isLoading
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SwipableStack(
                  controller: controller,
                  itemCount: data.length,
                  onSwipeCompleted: (index, direction) {
                    if (index == 1) {
                      setState(() {
                        profileImages.removeLast();
                      });
                    }
                  },
                  builder: (context, properties) {
                    return Container(
                      decoration: BoxDecoration(
                          // gradient: LinearGradient(
                          //   begin: Alignment.topLeft,
                          //   end: Alignment(0.8, 1),
                          //   colors: <Color>[

                          //   ], // Gradient from https://learnui.design/tools/gradient-generator.html
                          //   // tileMode: TileMode.mirror,
                          // ),
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        data[properties.index]["image"] != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  '${data[properties.index]["image"]}',
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Image.network(
                                'https://resize.indiatvnews.com/en/resize/newbucket/715_-/2020/12/pti28-12-2020-000048b-1609160104.jpg',
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                        Padding(
                          padding: const EdgeInsets.only(top: 22.0, left: 15),
                          child: Text(
                            data[properties.index]['title']!,
                            style: TextStyle(
                                color: ktealColor, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 22.0, left: 15, right: 15),
                          child: Text(
                            data[properties.index]['description']!,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                                // fontWeight: FontWeight.w700,
                                letterSpacing: 1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Itinerary: ',
                                style: TextStyle(
                                  color: ktealColor,
                                  fontFamily: "Montserrat",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '${data[properties.index]["itineraryRoute"]}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ])),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Itinerary Dates: ',
                                style: TextStyle(
                                  color: ktealColor,
                                  fontFamily: "Montserrat",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '${data[properties.index]["itineraryDates"]}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ])),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Itinerary Price: ',
                                style: TextStyle(
                                  color: ktealColor,
                                  fontFamily: "Montserrat",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '${data[properties.index]["itineraryPrice"]}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ])),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Itinerary Preferences: ',
                                style: TextStyle(
                                  color: ktealColor,
                                  fontFamily: "Montserrat",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '${data[properties.index]["itineraryPreferences"]}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ])),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Leader Name: ',
                                style: TextStyle(
                                  color: ktealColor,
                                  fontFamily: "Montserrat",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '${data[properties.index]["leaderName"]}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ])),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Active Members: ",
                              style: TextStyle(color: ktealColor, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 20),
                          child: Row(
                            children: [
                              for (String image in profileImages)
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(image),
                                    radius: 25.0,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 20),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    profileImages.add(
                                        "https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/yash.jpeg?alt=media&token=f26d9386-361f-4528-a7c5-1865940e75a9");
                                  });
                                  // Action to be performed when the button is tapped
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  //   return FormScreen();
                                  // }));
                                  print('Initiating trip...');
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                                  decoration: BoxDecoration(
                                    color: ktealColor,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Text(
                                    'Join this trip',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 20),
                              child: InkWell(
                                onTap: () {
                                  // Action to be performed when the button is tapped
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return FormScreen();
                                  }));
                                  print('Initiating trip...');
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                                  decoration: BoxDecoration(
                                    color: ktealColor,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Text(
                                    'Initiate a trip',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Padding(
                        //     padding: const EdgeInsets.only(top: 22.0, left: 15),
                        //     child: Row(children: [
                        //       Icon(
                        //         Icons.access_time,
                        //         color: Colors.white,
                        //         size: 15,
                        //       ),
                        //       SizedBox(
                        //         width: 5,
                        //       ),
                        //       Text(
                        //         '${5 + properties.index} hours ago',
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 15,
                        //             // fontWeight: FontWeight.w700,
                        //             letterSpacing: 1),
                        //       ),
                        //       SizedBox(
                        //         width: 10,
                        //       ),
                        //       Text(
                        //         '•',
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 13,
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 10,
                        //       ),
                        //       Text(
                        //         'Mumbai',
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 15,
                        //             // fontWeight: FontWeight.w700,
                        //             letterSpacing: 1),
                        //       ),
                        //     ]))
                      ]),
                    );
                  },
                ),
              )
            : Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: ktealColor),
                ],
              ),
      ],
    ));
  }
}

class ProfileRow extends StatelessWidget {
  final List<String> profileImages;

  ProfileRow({required this.profileImages});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (String image in profileImages)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(image),
              radius: 25.0,
            ),
          ),
      ],
    );
  }
}
