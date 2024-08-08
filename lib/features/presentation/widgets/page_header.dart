
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: SizedBox(
        
        width: double.infinity,
        height: 195,
        child: CircleAvatar
        (child: Image.asset('assets/images/641813.png'),
        backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
