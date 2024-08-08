
import 'package:flutter/material.dart';
import 'package:iti_project/features/presentation/pages/Onboarding2.dart';

class Onbording1 extends StatefulWidget {
  const Onbording1({super.key});

  @override
  State<Onbording1> createState() => _Onbording1State();
}

class _Onbording1State extends State<Onbording1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 50),
        child: Center(
          child: Column(
            children: [
              Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/images/Mask Group.png")),
              SizedBox(
                height: 50,
              ),
              Text(
                "Nectar E-commerce",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Text(
              //   " An ecommerce app allows users to shop online, browse product catalogs, create wish lists, add items to a cart, and complete purchases",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: Colors.grey,
              //   ),
              // ),
              Spacer(),
              InkWell(
                onTap: () {
               Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Onbording2()),);
                },
                child: Container(
                  height: 100,
                  child: Image.asset(
                    "assets/images/next1.png",
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
