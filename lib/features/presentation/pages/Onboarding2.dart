
import 'package:flutter/material.dart';
import 'package:iti_project/features/presentation/pages/Onboarding3.dart';

class Onbording2 extends StatefulWidget {
  const Onbording2({super.key});

  @override
  State<Onbording2> createState() => _Onbording2State();
}

class _Onbording2State extends State<Onbording2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 50),
        child: Center(
          child: Column(
            children: [
              Container(
                  height: 300,
                  width: 300,
                  child: Image.asset("assets/images/onbording1.png")),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome To Nectar E-commerce",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                " An ecommerce app allows users to shop online, browse product catalogs, create wish lists, add items to a cart, and complete purchases",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Onbording3()),);
                },
                child: Container(
                  height: 100,
                  child: Image.asset(
                    "assets/images/next2.png",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
