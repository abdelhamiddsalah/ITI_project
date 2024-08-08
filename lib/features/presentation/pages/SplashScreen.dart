import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iti_project/features/presentation/pages/Splash2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
    //Navigator.of(context).pushReplacementNamed('/splash2');
    //    Navigator.pushNamed(context, '/splash2');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Splash2()),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
           Image.asset("assets/images/logo (2).png")
            ],
          ),
        ),
      ),
    );
  }
}