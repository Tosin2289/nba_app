import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Future getTeams() async {
    var response = await http.get(Uri.https('balldontlie.io', '/api/v1/teams'));
    var jsonData = jsonDecode(response.body);
    List<team> Teams = [];
    for (var u in jsonData['data']) {
      team teams =
          team(u['full_name'], u['abbreviation'], u['city'], u['division']);
      Teams.add(teams);
    }
    return Teams;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder(
          future: getTeams(),
          builder: ((context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(child: Lottie.asset('assets/basketloading.json')),
              );
            } else
              return RefreshIndicator(
                onRefresh: getTeams,
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 12),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: ListTile(
                            leading: Text(
                              snapshot.data[index].abbreviation,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            title: Text(
                              snapshot.data[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(snapshot.data[index].division),
                            trailing: Text(snapshot.data[index].city),
                          ),
                        ),
                      );
                    })),
              );
          }),
        ),
      ),
    );
  }
}

class team {
  final String name;
  final String abbreviation;
  final String division;
  final String city;
  team(this.name, this.abbreviation, this.city, this.division);
}
