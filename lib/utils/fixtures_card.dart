import 'package:flutter/material.dart';

class FixturesCard extends StatelessWidget {
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
  FixturesCard(
      {Key? key,
      required this.home_team_abbreviation,
      required this.home_team_name,
      required this.home_team_score,
      required this.visitor_team_score,
      required this.visitor_team_abbreviation,
      required this.visitor_team_name,
      required this.status,
      required this.date,
      required this.time,
      required this.season})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Container(
        height: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 228, 26, 12),
                Color.fromARGB(255, 5, 98, 175)
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "HOME",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    status,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "AWAY",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    home_team_abbreviation,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text(
                        home_team_name.toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        visitor_team_name.toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    visitor_team_abbreviation,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        home_team_score.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        ":",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        visitor_team_score.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                date.toString(),
                style: TextStyle(
                    color: Color.fromARGB(255, 187, 169, 8),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                season.toString(),
                style: TextStyle(
                  color: Color.fromARGB(255, 179, 176, 176),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
