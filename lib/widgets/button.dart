import 'package:flutter/material.dart';

class button extends StatefulWidget {
  final String text;
  final double hght,wid;
  final  VoidCallback ontap;
  button({super.key,required this.text,required this.hght,required this.wid,required this.ontap});

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return Container(height: widget.hght,width: widget.wid,
    decoration: BoxDecoration(color:Colors.deepPurple,borderRadius: BorderRadius.circular(15)),
    child: TextButton(onPressed:widget.ontap , child:Text(widget.text)));
     // );
  }
}