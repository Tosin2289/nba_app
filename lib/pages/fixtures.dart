import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nba_app/utils/fixtures_card.dart';
import 'package:http/http.dart' as http;

class Fixtures extends StatefulWidget {
  const Fixtures({Key? key}) : super(key: key);

  @override
  State<Fixtures> createState() => _FixturesState();
}

class _FixturesState extends State<Fixtures> {
  Future getFixtures() async {
    try {
      var url =
          'https://www.balldontlie.io/api/v1/games?seasons[]=2022&per_page=100&page=13';
      var response = await http.get(Uri.parse(url));

      var jsonData = json.decode(response.body);

      List<fixture> Fixtures = [];
      for (var eachfixture in jsonData['data']) {
        fixture Fixture = fixture(
            home_team_abbreviation: eachfixture['home_team']['abbreviation'],
            home_team_name: eachfixture['home_team']['name'],
            home_team_score: eachfixture['home_team_score'],
            visitor_team_score: eachfixture['visitor_team_score'],
            visitor_team_abbreviation: eachfixture['visitor_team']
                ['abbreviation'],
            visitor_team_name: eachfixture['visitor_team']['name'],
            status: eachfixture['status'],
            date: eachfixture['date'],
            time: eachfixture['time'],
            season: eachfixture['season']);
        Fixtures.add(Fixture);
      }

      return Fixtures;
    } catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              content: Text('Network Error ☹️'),
            );
          }));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FutureBuilder(
              future: getFixtures(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                        child: Lottie.asset('assets/basketloading.json')),
                  );
                } else
                  return RefreshIndicator(
                    onRefresh: () async {
                      setState(() {
                        getFixtures();
                      });
                    },
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: ((context, index) {
                          return FixturesCard(
                              season: snapshot.data[index].season,
                              home_team_abbreviation:
                                  snapshot.data[index].home_team_abbreviation,
                              home_team_name:
                                  snapshot.data[index].home_team_name,
                              home_team_score:
                                  snapshot.data[index].home_team_score,
                              visitor_team_score:
                                  snapshot.data[index].visitor_team_score,
                              visitor_team_abbreviation: snapshot
                                  .data[index].visitor_team_abbreviation,
                              visitor_team_name:
                                  snapshot.data[index].visitor_team_name,
                              status: snapshot.data[index].status,
                              date: snapshot.data[index].date,
                              time: snapshot.data[index].time);
                        })),
                  );
              },
            ),
          ),
        ));
  }
}

class fixture {
  final home_team_abbreviation;
  final home_team_name;
  final home_team_score;
  final visitor_team_score;
  final visitor_team_abbreviation;
  final visitor_team_name;
  final status;
  final date;
  final time;
  final season;
  fixture(
      {required this.home_team_abbreviation,
      required this.home_team_name,
      required this.home_team_score,
      required this.visitor_team_score,
      required this.visitor_team_abbreviation,
      required this.visitor_team_name,
      required this.status,
      required this.date,
      required this.time,
      required this.season});
}
