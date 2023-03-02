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
    await Future.delayed(Duration(milliseconds: 3000), (() {}));
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(),
          Lottie.asset(
            'assets/splashlogo.json',
            fit: BoxFit.cover,
          ),
          ShaderMask(
            shaderCallback: (bounds) =>
                const LinearGradient(colors: [Colors.red, Colors.blue])
                    .createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              "Made By Phenomes",
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      )),
    );
  }
}
