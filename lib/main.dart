import 'package:flutter/material.dart';
import 'package:iti_project/features/presentation/pages/Home_Category.dart';
import 'package:iti_project/features/presentation/pages/Splash2.dart';
import 'package:iti_project/features/presentation/pages/SplashScreen.dart';





void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
        routes: {
     //   "/": (BuildContext context) => StartPage(),
     //   "/login": (BuildContext context) => StartScreen(),
       // "/register": (BuildContext context) => RegisterPage(),
       // "/home": (BuildContext context) => HomePage(),
      },
      home: SplashScreen(),

    );
  }
}
