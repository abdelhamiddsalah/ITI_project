import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iti_project/features/presentation/pages/Onboarding1.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _State();
}

class _State extends State<Splash2> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Onbording1()),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                // height: 400,
                width: 150,
                'assets/images/Frame 5.png',
                fit: BoxFit.cover,
                // color: Colors.greenAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}