// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Brand {
  
  String title;
  Brand({
   
    required this.title,
  });
}

List<Brand> brandList = [
  Brand( title: 'Jewlery'),
  Brand( title: 'Clothes'),
  Brand( title: 'Drinks'),
  Brand(title: 'Foods'),

];


List<String> Bannerimages = [
  "assets/images/1.jpeg",
   "assets/images/7.jpeg",
 "assets/images/11.jpeg",
  
];



List list = [
  "Home",
  "Profile",
  "Categories",
  "Foods",
  "Jewelry",
  "Sweet T-Shirt",
  "Shoses",
];
List<Widget> icons = [
  CircleAvatar(
    child: Icon(Icons.home),
  ),
  CircleAvatar(
    child: Icon(Icons.account_circle),
  ),
  CircleAvatar(
    child: Icon(Icons.category_outlined),
  ),
  CircleAvatar(
    child: Icon(Icons.food_bank_outlined),
  ),
  CircleAvatar(
    child: Icon(Icons.join_inner_rounded),
  ),
  Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
    ),
    child: Image.asset(
      "assets/images/Sweet tshirt.png",
      height: 50,
      width: 50,
    ),
  ),
  Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
    ),
    child: Image.asset(
      "assets/images/Shose.png",
      height: 50,
      width: 50,
    ),
  ),
];
