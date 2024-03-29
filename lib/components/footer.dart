import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:greengaurd/screens/help/chat.dart';
import 'package:greengaurd/screens/itembuy/category.dart';
import 'package:greengaurd/screens/home/home.dart';
import 'package:greengaurd/screens/practices/agriculturepractices.dart';
import 'package:greengaurd/screens/practices/practices.dart';



class footer extends StatefulWidget {
  const footer({super.key});

  @override
  State<footer> createState() => _footerState();
}

class _footerState extends State<footer> {
  @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Row(children: [Container(height: hght*0.07,width: wid,color: const Color.fromARGB(157, 158, 158, 158),child: Row(children: [
       Container(height:hght*0.07,width: wid*0.25 ,child: IconButton(
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>home())), icon:Icon(Icons.home)),),
      Container(height:hght*0.07,width: wid*0.25 ,child: IconButton(
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>category())), icon:Icon(Icons.shop)),),
        Container(height:hght*0.07,width: wid*0.25 ,child: IconButton(
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>practices())), icon:Icon(Icons.blur_circular)),),
       Container(height:hght*0.07,width: wid*0.25 ,child: IconButton(
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen())), icon:Icon(Icons.help)),),

            
            
             ],),)],);
  }
}