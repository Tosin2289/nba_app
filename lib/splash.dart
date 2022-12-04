import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nba_app/main.dart';
import 'package:nba_app/pages/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigatetohome();
  }

  navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 5000), (() {}));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
      return HomePage();
    })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.asset(
            'assets/splashlogo.json',
            fit: BoxFit.cover,
          ),
        ],
      )),
    );
  }
}
