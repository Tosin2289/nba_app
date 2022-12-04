import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nba_app/pages/fixtures.dart';
import 'package:nba_app/pages/homepage.dart';
import 'package:nba_app/pages/players.dart';
import 'package:nba_app/pages/news.dart';
import 'package:nba_app/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [
    MyHomePage(),
    Fixtures(),
    Players(),
    NewsPage(),
  ];
  int _currentindex = 1;
  void currentpage(index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              onTabChange: currentpage,
              selectedIndex: _currentindex,
              padding: EdgeInsets.all(16),
              tabBackgroundColor: Colors.grey.shade800,
              activeColor: Colors.red,
              color: Colors.white,
              gap: 8,
              backgroundColor: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.sports_basketball_outlined,
                  iconSize: 30,
                  text: 'Teams',
                ),
                GButton(
                  icon: Icons.calendar_month_outlined,
                  iconSize: 30,
                  text: 'Fixtures',
                ),
                GButton(
                  icon: Icons.person_outlined,
                  iconSize: 30,
                  text: 'Players',
                ),
                GButton(
                  icon: Icons.newspaper_outlined,
                  iconSize: 30,
                  text: 'News',
                ),
              ]),
        ),
      ),
      body: pages[_currentindex],
    );
  }
}
