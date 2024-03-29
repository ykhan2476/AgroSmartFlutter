import 'package:flutter/material.dart';

class headings extends StatelessWidget {
  String text1;
  headings({super.key, required this.text1});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(text1,style: TextStyle(fontSize: 40,color: Colors.deepPurple),),);
  }
}
