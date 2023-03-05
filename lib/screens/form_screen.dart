import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:intl/intl.dart';
import 'package:trinity/utils/constants.dart';
import 'package:http/http.dart' as http;

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController departureController = TextEditingController();
  TextEditingController tripNameController = TextEditingController();
  TextEditingController tripDescriptionController = TextEditingController();
  TextEditingController tripVideoController = TextEditingController();
  TextEditingController accomodationController = TextEditingController();
  TextEditingController itineraryRouteController = TextEditingController();
  TextEditingController itineraryPriceController = TextEditingController();
  int minimum = 0;
  int maximum = 0;
  GlobalKey _formKey = GlobalKey();
  String selectedItem = 'Hill Station';
  int? selectedRadio;
  String selectedAccomodation = 'Hotels';
  InputDecoration _commonInputDecoration(String hintText, BuildContext context) {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.fromLTRB(10, 8, 10, 8),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.teal, width: 1.0),
      ),
      hintText: '$hintText',
    );
  }

  List<String> dropDownValues = [
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

  List<String> accomodationValues = ['Hotels', 'Apartments', 'Camping', 'Hostel', 'Bed & Breakfast', 'Other'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Initiate a Trip'),
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            shrinkWrap: true,
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                  controller: departureController, //editing controller of this TextField
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.teal),
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.teal,
                      ), //icon of text field
                      labelText: "Departure Date" //label text of field
                      ),
                  readOnly: true, // when true user cannot edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      print(pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(
                          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                      print(formattedDate); //formatted date output using intl package =>  2022-07-04
                      //You can format date as per your need

                      setState(() {
                        departureController.text = formattedDate; //set foratted date to TextField value.
                      });
                    } else {
                      departureController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              Text(
                'Pick Category',
                style: TextStyle(color: Colors.teal),
              ),
              DropdownButton<String>(
                isExpanded: true,
                alignment: AlignmentDirectional.topStart,
                // itemHeight: 30,
                value: selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedItem = newValue!;
                  });
                },
                items: dropDownValues.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Type of Trip',
                style: TextStyle(color: Colors.teal),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 110,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black.withOpacity(0.5),
                          //     spreadRadius: 2,
                          //     blurRadius: 2,
                          //     offset: Offset(0, 3), // changes position of shadow
                          //   ),
                          // ],
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedRadio = 1;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: selectedRadio == 1 ? Colors.teal : Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 1)),
                                  ),
                                  Text(
                                    'Guided',
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'You are taking the leading and making all the arrangments for the others on the trip',
                              maxLines: 4,
                              style: TextStyle(color: Colors.black, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 105,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black.withOpacity(0.5),
                          //     spreadRadius: 2,
                          //     blurRadius: 2,
                          //     offset: Offset(0, 3), // changes position of shadow
                          //   ),
                          // ],
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedRadio = 2;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: selectedRadio == 2 ? Colors.teal : Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 1)),
                                  ),
                                  Text(
                                    'Co-working',
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Shared accomodation and working space with other remote professionals',
                              maxLines: 3,
                              style: TextStyle(color: Colors.black, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Trip name',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              TextField(
                  controller: tripNameController,
                  maxLines: 2,
                  decoration: _commonInputDecoration('eg Travel like a local through Thailand', context)),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Trip Description',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              TextField(
                controller: tripDescriptionController,
                maxLines: 10,
                decoration: _commonInputDecoration('Give a brief description of the trip', context),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Trip Highlights Video',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              TextField(
                controller: accomodationController,
                maxLines: 3,
                decoration: _commonInputDecoration('Paste the video URL here', context),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Itinerary Route',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              TextField(
                  controller: itineraryRouteController,
                  maxLines: 1,
                  decoration: _commonInputDecoration('eg Mumbai - Gujarat - Delhi', context)),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Itinerary Price',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              TextField(
                  controller: itineraryPriceController,
                  maxLines: 1,
                  decoration: _commonInputDecoration('eg Rs. 10000', context)),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Select the type of Accomodation',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              DropdownButton<String>(
                isExpanded: true,
                alignment: AlignmentDirectional.topStart,
                // itemHeight: 30,
                value: selectedAccomodation,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedAccomodation = newValue!;
                  });
                },
                items: accomodationValues.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'No of Trip Mates',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Minimum'),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (minimum != 0) minimum--;
                                });
                              },
                              icon: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 0.5, color: Colors.grey)),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.teal,
                                  ))),
                          Text('$minimum'),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  minimum++;
                                });
                              },
                              icon: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 0.5)),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.teal,
                                  ))),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Maximum'),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (maximum != 0) maximum--;
                                });
                              },
                              icon: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 0.5, color: Colors.grey)),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.teal,
                                  ))),
                          Text('$maximum'),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  maximum++;
                                });
                              },
                              icon: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 0.5)),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.teal,
                                  ))),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: InkWell(
                  onTap: () async {
                    // Submit button pressed
                    // Loader.show(context, progressIndicator: CircularProgressIndicator(color: Colors.blue));
                    Uri uri = Uri.parse('https://bitbardcoc-production.up.railway.app/host');
                    final res = await http.post(uri,
                        body: jsonEncode({
                          "title": tripNameController.text,
                          "desc": tripDescriptionController.text,
                          "itineraryRoute": itineraryRouteController.text,
                          "itineraryDates": departureController.text,
                          "itineraryPrice": itineraryPriceController.text,
                        }),
                        headers: {'Content-Type': 'application/json'});
                    final body = res.body;
                    if (res.statusCode == 201) {}
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: ktealColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
