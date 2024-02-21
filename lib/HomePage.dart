import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List teams = [];

  // get data
  Future getData() async {
    var response = await http.get(Uri.https('balldontlie.io', '/api/v1/teams'));
    // print(response.body);
    var jsonData = jsonDecode(response.body);
    for (var eachtm in jsonData["data"]) {
      final team =
          teamModel(abbr: eachtm["abbreviation"], city: eachtm["city"]);
      teams.add(team);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1B4F91),
        title: Text("NBA Teams "),
      ),
      backgroundColor: Color(0xffCE2836),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xfffefefe),
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                          title: Text(teams[index].abbr),
                          subtitle: Text(
                            teams[index].city,
                          )),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class teamModel {
  final String? abbr;
  final String? city;

  teamModel({required this.abbr, required this.city});
}
// 1B4F91 blue red CE2836
