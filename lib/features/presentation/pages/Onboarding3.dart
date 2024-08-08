import 'package:flutter/material.dart';
import 'package:iti_project/features/presentation/pages/Home_Category.dart';



class Onbording3 extends StatefulWidget {
  const Onbording3({super.key});

  @override
  State<Onbording3> createState() => _Onbording3State();
}

class _Onbording3State extends State<Onbording3> {
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
                "  Browse all the category  ",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                " It also provides payment processing, shipping, and order management capabilities.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
              // Navigator.pushReplacement(   context,   MaterialPageRoute(builder: (context) => StartScreen()),);
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => StartScreen()));
           //   Navigator.pushNamed(context, "/login");
                },
                child: Image.asset(
                  "assets/images/next3.png",
                  height: 150,
                  width: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}