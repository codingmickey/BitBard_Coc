import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:trinity/animations/circle_painter.dart';
import 'package:trinity/animations/curve_wave.dart';
import 'package:trinity/utils/constants.dart';
import 'package:flutter/animation.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:progress_indicators/progress_indicators.dart';

// import 'package:rippledemo/circle_painter.dart';
// import 'package:rippledemo/curve_wave.dart';

class BluetoothScreen extends StatefulWidget {
  const BluetoothScreen({super.key});

  @override
  State<BluetoothScreen> createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> with TickerProviderStateMixin {
  // FlutterBlue flutterBlue = FlutterBlue.instance;
  FlutterScanBluetooth _bluetooth = FlutterScanBluetooth();
  AnimationController? _controller;

  List<String> data = [];
  bool isScanning = true;

  void getBluetoothDevices() async {
    await _bluetooth.startScan();
  }

  List<String> profileImag = [
    "https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/WhatsApp%20Image%202023-03-04%20at%2017.26.13.jpeg?alt=media&token=bc88699a-2007-4223-8aee-14880bdadfbf",
    "https://firebasestorage.googleapis.com/v0/b/fresh-repeater-379606.appspot.com/o/WhatsApp%20Image%202023-03-04%20at%2017.30.53.jpeg?alt=media&token=3506f92d-0c5d-4812-820f-5ce4688c4bfa"
  ];

  List<String> names = ["Kartik Jolapara", "Hardik Gupta"];
  List<String> interests = ["Hiking, Beaches, Hill Stations", "Waterfalls, Historic Places, Parks"];
  List<String> whatsappUrl = ["whatsapp://send?phone=919619247188", "whatsapp://send?phone=918655252587"];

  // Future<List> appendElements(Future<List> listFuture, BluetoothDevice elementsToAdd) async {
  //   final list = await listFuture;
  //   list.addAll(elementsToAdd);
  //   return list;
  // }

  @override
  void initState() {
    // TODO: implement initState
    print("initcalled");
    getBluetoothDevices();
    data.clear();
    _bluetooth.devices.listen((device) {
      // print("Yash");
      setState(() {
        isScanning = true;
      });
      print(device.name);

      String deviceName = device.name;
      data.add(deviceName);

      // setState(() {
      //   _data += device.name+' (${device.address})\n';
      // });
    });
    _bluetooth.scanStopped.listen((device) {
      setState(() {
        isScanning = false;
        data.removeWhere((element) => element != "realme 7 pro" && element != "codingmickey");
        if (data.length > 2) {
          data.removeLast();
        }
        print(data);
        // _data += 'scan stopped\n';
      });
    });

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
    // flutterBlue.startScan(timeout: Duration(seconds: 4));
    // var subscription = flutterBlue.scanResults.listen((results) {
    //   // do something with scan results
    //   for (ScanResult r in results) {
    //     // print('User found');
    //     print('${r.device.name}');
    //   }
    // });

    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Widget _button() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[
                ktealColor.withOpacity(0.8),
                kwhiteColor
                // Color.lerp(widget.color, Colors.black, .05)
              ],
            ),
          ),
          child: ScaleTransition(
              scale: Tween(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller!,
                  curve: const CurveWave(),
                ),
              ),
              child: Icon(
                Icons.speaker_phone,
                size: 44,
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: isScanning ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisAlignment: isScanning ? MainAxisAlignment.center : MainAxisAlignment.start,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          isScanning
              ? Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 15, top: 50),
                    child: CustomPaint(
                      painter: CirclePainter(
                        _controller!,
                        color: ktealColor.withOpacity(0.3),
                      ),
                      child: SizedBox(
                        width: 80 * 4.125,
                        height: 80 * 4.125,
                        child: _button(),
                      ),
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(left: 40, top: 50),
                  child: CustomPaint(
                    painter: CirclePainter(
                      _controller!,
                      color: ktealColor.withOpacity(0.3),
                    ),
                    child: SizedBox(
                      width: 80 * 4.125,
                      height: 80 * 4.125,
                      child: _button(),
                    ),
                  ),
                ),

          isScanning
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Searching Nearby Travel Buddies  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: ktealColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: JumpingDotsProgressIndicator(
                        fontSize: 30.0,
                        color: ktealColor,
                        numberOfDots: 4,
                      ),
                    ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: () {
                    print(data.length);
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                children: [
                                  // Profile Image
                                  CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(profileImag[index]),
                                  ),
                                  // Name and Interests Column
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
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
                                          // Interests Text Widget

                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                              text: 'Interests: ',
                                              style: TextStyle(
                                                color: ktealColor,
                                                fontFamily: "Montserrat",
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: interests[index],
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ])),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: InkWell(
                                              onTap: () async {
                                                await launchUrl(Uri.parse("whatsapp://send?phone=918655252587"));
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
                            ),
                            // color: ktealColor,
                            // height: 20,
                            // width: 20,
                          );
                        });
                    // data.map((e) {
                    //   return Container(
                    //     color: Colors.red,
                    //     height: 20,
                    //     width: 20,
                    //   );
                    // });
                  }(),
                  // child: FutureBuilder(
                  //     future: data,
                  //     builder: (context, snapshot) {
                  //   if (snapshot.hasData) {
                  //     var data = (snapshot.data as List).toList();
                  //     return Container(height: 650, width: MediaQuery.of(context).size.width, child: Container());
                  //   } else {
                  // return Row(
                  //   // crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     CircularProgressIndicator(color: ktealColor),
                  //   ],
                  // );
                  //   }
                  // }),
                ),
          // isScanning ?
        ],
      ),
    );
  }
}
