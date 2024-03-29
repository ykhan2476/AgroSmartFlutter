import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class soil extends StatefulWidget {
   soil({super.key});

  @override 
  State<soil> createState() => _soilState();
}


class _soilState extends State<soil> {
  final soilsref = FirebaseDatabase.instance.reference().child('Soil quality and fertility');
  @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    
    return Scaffold(
       appBar: AppBar(title: Text('Soil quality and fertility') ,
                       foregroundColor: Color.fromARGB(252, 12, 2, 2),
                       actions: [IconButton(onPressed: (){}, icon: Icon(Icons.help))],
                       ), 
    
       body:Container(color: Color.fromARGB(255, 226, 230, 232),
       child: FirebaseAnimatedList(
        query: soilsref, shrinkWrap: true,itemBuilder: (context, snapshot, animation, index) {
          Map agro = snapshot.value as Map;
         agro['key']=snapshot.key;
          return GestureDetector(
            onTap: () {},
            child:Container(width: wid*0.92,margin: EdgeInsets.all(15) ,
             decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10),color: Colors.white),
            child:Column(children: [
              Container(height:  wid*0.6,width: wid*0.94,clipBehavior: Clip.antiAlias,decoration: BoxDecoration(borderRadius
                :BorderRadiusDirectional.only(topStart:Radius.circular(10),topEnd: Radius.circular(10))),
                child:Image.asset('assets/images/f1.jpeg',fit: BoxFit.cover,)),// Image.network('${agro['practice']['image']}' ,fit: BoxFit.cover,),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(agro['practice']['name'],style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
             
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),      
                   tileColor: Colors.indigo[100], title: Text(agro['practice']['description'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),), 
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(agro['practice']['description1'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(agro['practice']['description2'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),              
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(agro['practice']['description3'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(agro['practice']['description4'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(agro['practice']['description5'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(agro['practice']['description6'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(agro['practice']['description7'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(agro['practice']['description8'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(agro['practice']['description9'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(agro['practice']['description10'],style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,),),),
            ],),
            ));})));}
          }     
    

