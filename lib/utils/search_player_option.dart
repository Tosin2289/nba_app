import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:nba_app/utils/search_card.dart';

class SearchPlayer extends StatelessWidget {
  final player;
  SearchPlayer({Key? key, required this.player}) : super(key: key);
  Future getPlayers() async {
    var url = 'https://www.balldontlie.io/api/v1/players?search=$player';
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    List<players> Players = [];
    for (var eachplayer in jsonData['data']) {
      players Player = players(
          firstname: eachplayer['first_name'],
          lastname: eachplayer['last_name'],
          position: eachplayer['position'],
          height_feet: eachplayer['height_feet'],
          height_inches: eachplayer['height_inches'],
          weight: eachplayer['weight_pounds'],
          team_name: eachplayer['team']['name']);
      Players.add(Player);
    }

    return Players;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: FutureBuilder(
              future: getPlayers(),
              builder: ((context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                        child: Lottie.asset('assets/basketloading.json')),
                  );
                } else
                  return RefreshIndicator(
                    onRefresh: getPlayers,
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: ((context, index) {
                          return SearchCard(
                              firstname: snapshot.data[index].firstname,
                              lastname: snapshot.data[index].lastname,
                              position: snapshot.data[index].position,
                              height_feet: snapshot.data[index].height_feet,
                              height_inches: snapshot.data[index].height_inches,
                              weight: snapshot.data[index].weight,
                              team_name: snapshot.data[index].team_name);
                        })),
                  );
              }))),
    );
  }
}

class players {
  final firstname;
  final lastname;
  final position;
  final height_feet;
  final height_inches;
  final weight;
  final team_name;
  players({
    required this.firstname,
    required this.lastname,
    required this.position,
    required this.height_feet,
    required this.height_inches,
    required this.weight,
    required this.team_name,
  });
}
