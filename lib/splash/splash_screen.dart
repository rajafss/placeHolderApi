import 'dart:async';
import 'package:flutter/material.dart';
import 'package:placeholderapi/screens/home_screen.dart';
import 'package:placeholderapi/screens/login/login.dart';
import '../screens/apititle_screen.dart';

class SplashScrren extends StatefulWidget {
  const SplashScrren({Key? key}) : super(key: key);

  @override
  State<SplashScrren> createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    LoginScreen()
            )
        )
    );
  }

  // _splashScrren() async{
  //   await Future.delayed(Timer(Duration(seconds: 3)));
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/image.png',fit: BoxFit.cover,),
      ),
    );
  }
}
