import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_monitoring_app/app_bar.dart';
import 'package:health_monitoring_app/home_container.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Progress",
                      style: GoogleFonts.cabin(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomeContainer(
                            "Steps",
                            Container(
                              height: 130,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text("2345",
                                      style: const TextStyle(fontSize: 22)),
                                  SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: CircularProgressIndicator(
                                      value: 2345 / 3000,
                                      strokeWidth: 5,
                                      valueColor: const AlwaysStoppedAnimation(
                                          Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            () => null),
                        HomeContainer(
                            "Sleep",
                            Container(
                                height: 120,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("8h 37min",
                                          style: GoogleFonts.cabin(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
                                      Text("last sleep",
                                          style: GoogleFonts.cabin(
                                              fontSize: 13,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                )),
                            () => null),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomeContainer(
                            "Heart Rate",
                            Container(
                              height: 120,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("98",
                                            style: GoogleFonts.cabin(
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold)),
                                        Text(" bpm",
                                            style: GoogleFonts.cabin(
                                                fontSize: 14,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                    Text("Normal",
                                        style: GoogleFonts.cabin(
                                            fontSize: 14,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                              ),
                            ),
                            () => null),
                        HomeContainer(
                            "Meditate",
                            Container(
                                height: 120,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("47 min",
                                          style: GoogleFonts.cabin(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
                                      Text("last recorded",
                                          style: GoogleFonts.cabin(
                                              fontSize: 13,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                )),
                            () => null),
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> fetchData() async {
  final response = await http.get(
    Uri.parse('https://your-api-url.com/health-stats'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return json.decode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}
