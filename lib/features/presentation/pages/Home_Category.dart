

import 'package:flutter/material.dart';
import 'package:iti_project/features/presentation/pages/DrinksPage.dart';

import 'package:iti_project/features/presentation/pages/FoodsPage.dart';
import 'package:iti_project/features/presentation/pages/JewelryPage.dart';
import 'package:iti_project/features/presentation/pages/RandomPage.dart';



class StartScreen extends StatelessWidget {
 const StartScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body:
         Column(
           children: [
            SizedBox(height: 30,),
            Image.asset('assets/images/Mask Group.png', width: 150,height: 150,),
            SizedBox(height: 30,),
            Text("Categories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
            SizedBox(height: 30,),
             Expanded(
               child: GridView.builder(
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                 itemCount: 1,
                 itemBuilder: (_, index) {
                   return Column(
                     children: [
                       MaterialButton(
                        color: Colors.green,
                onPressed: (){
                  Navigator.pushReplacement( context,  MaterialPageRoute(builder: (context) => MealPage()),);
                },
                child: Text('Foods', style: TextStyle(fontSize: 30, color: Colors.white),)),
               SizedBox(height: 20,),
              MaterialButton(
                        color: Colors.green,
                onPressed: (){
                   Navigator.pushReplacement( context,  MaterialPageRoute(builder: (context) => JewelryPage()),);
                },
                child: Text('Jewlery', style: TextStyle(fontSize: 30, color: Colors.white),)),
                 SizedBox(height: 20,),
                MaterialButton(
                        color: Colors.green,
                onPressed: (){
                    Navigator.pushReplacement( context,  MaterialPageRoute(builder: (context) => Randompage()),);
                },
                child: Text('Clothes', style: TextStyle(fontSize: 30, color: Colors.white),)),
                 SizedBox(height: 20,),
                 MaterialButton(
                        color: Colors.green,
                onPressed: (){
                   Navigator.pushReplacement( context,  MaterialPageRoute(builder: (context) => DrinkPage()),);
                },
                child: Text('Drinks', style: TextStyle(fontSize: 30, color: Colors.white),)),
                 SizedBox(height: 20,),
                     ],
                   );
                 },
                 
               ),
             ),
           ],
         ),
         
        
     
      
    );
  }
}
AppBar appbar() {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.green,
      title: const Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Menofia, Egypt",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ]
      )
    );
}