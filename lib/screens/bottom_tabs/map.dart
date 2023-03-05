import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart';
import 'package:trinity/utils/direction_model.dart';
import 'package:trinity/utils/direction_repository.dart';

class MapScreen extends StatefulWidget {
  MapScreen({required this.latitude, required this.longitude});
  double latitude;
  double longitude;
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  CameraPosition _initialCameraPosition = CameraPosition(target: LatLng(0, 0));
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? googleMapController;
  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latLen = <LatLng>[
    LatLng(19.103193327534655, 72.83755904333447),
    // LatLng(19.115939262800357, 72.83452542996636),
    LatLng(19.109550314781174, 72.83682358380977),
    LatLng(19.107644430596093, 72.83717816852801),
  ];
  _onStyleLoadedCallback() async {}

  Directions? _info;

  loadData() async {
    // makers added according to index
    _markers.add(
      Marker(
          // given marker id
          markerId: MarkerId("1"),
          // given marker icon
          // given position
          position: _latLen[0],
          onTap: () async {
            print('Hello');
            final directions = await DirectionsRepository()
                .getDirections(origin: LatLng(widget.latitude, widget.longitude), destination: _latLen[0]);
            googleMapController!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: _latLen[0],
              zoom: 16,
              // tilt: 50.0,
            )));
            print(directions!.polylinePoints);
            setState(() => _info = directions);
          }),
    );
    _markers.add(
      Marker(
          // given marker id
          markerId: MarkerId("2"),
          // given marker icon
          // given position
          position: _latLen[1],
          onTap: () async {
            print('Hello');
            final directions = await DirectionsRepository()
                .getDirections(origin: LatLng(widget.latitude, widget.longitude), destination: _latLen[1]);
            googleMapController!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: _latLen[0],
              zoom: 16,
              // tilt: 50.0,
            )));
            setState(() => _info = directions);
          }),
    );
    _markers.add(
      Marker(
          // given marker id
          markerId: MarkerId("3"),
          // given marker icon
          // given position
          position: _latLen[2],
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(title: 'You are here')),
    );
    // _markers.add(
    //   Marker(
    //     // given marker id
    //     markerId: MarkerId("4"),
    //     // given marker icon
    //     // given position
    //     position: _latLen[3],
    //   ),
    // );

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    googleMapController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GoogleMap(
                initialCameraPosition: CameraPosition(target: LatLng(19.10766470606149, 72.8371567106055), zoom: 15),
                markers: Set<Marker>.of(_markers),
                mapType: MapType.normal,
                myLocationEnabled: true,
                polylines: {
                  if (_info != null)
                    Polyline(
                      polylineId: const PolylineId('overview_polyline'),
                      color: Colors.blue,
                      width: 5,
                      points: _info!.polylinePoints.map((e) => LatLng(e.latitude, e.longitude)).toList(),
                    ),
                },
                onMapCreated: (GoogleMapController controller) {
                  _controllerGoogleMap.complete(controller);
                  googleMapController = controller;
                  googleMapController!.setMapStyle('''
                    [
                      {
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#242f3e"
                          }
                        ]
                      },
                      {
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#746855"
                          }
                        ]
                      },
                      {
                        "elementType": "labels.text.stroke",
                        "stylers": [
                          {
                            "color": "#242f3e"
                          }
                        ]
                      },
                      {
                        "featureType": "administrative.locality",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "poi",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "poi.park",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#263c3f"
                          }
                        ]
                      },
                      {
                        "featureType": "poi.park",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#6b9a76"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#38414e"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "geometry.stroke",
                        "stylers": [
                          {
                            "color": "#212a37"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#9ca5b3"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#746855"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "geometry.stroke",
                        "stylers": [
                          {
                            "color": "#1f2835"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#f3d19c"
                          }
                        ]
                      },
                      {
                        "featureType": "transit",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#2f3948"
                          }
                        ]
                      },
                      {
                        "featureType": "transit.station",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#17263c"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#515c6d"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "labels.text.stroke",
                        "stylers": [
                          {
                            "color": "#17263c"
                          }
                        ]
                      }
                    ]
                ''');
                }),
          ),
        ],
      )),
    );
  }
}
