import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class birds extends StatefulWidget {
   birds({super.key});

  @override 
  State<birds> createState() => _birdsState();
}


class _birdsState extends State<birds> {
  final birdsref = FirebaseDatabase.instance.reference().child('Birds');
  @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    
    return Scaffold(
       appBar: AppBar(title: Text('hello') ,
                       foregroundColor: Color.fromARGB(252, 12, 2, 2),
                       actions: [IconButton(onPressed: (){}, icon: Icon(Icons.help))], ),    
       body:Container(color: Color.fromARGB(255, 226, 230, 232),child: FirebaseAnimatedList(
        query: birdsref, shrinkWrap: true,itemBuilder: (context, snapshot, animation, index) {
          Map birds = snapshot.value as Map;
         birds['key']=snapshot.key;
          return GestureDetector(
            onTap: () {},
            child:Container(width: wid*0.92,margin: EdgeInsets.all(15) ,
             decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10),color: Colors.white),
            child:Column(children: [
              Container(height:  wid*0.6,width: wid*0.94,clipBehavior: Clip.antiAlias,decoration: BoxDecoration(borderRadius
                :BorderRadiusDirectional.only(topStart:Radius.circular(10),topEnd: Radius.circular(10))),
                child:Image.asset('assets/images/f6.jpeg',fit: BoxFit.cover,)),// Image.network('${birds['practice']['image']}',fit: BoxFit.cover,),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(birds['practice']['name'],style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
             
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),      
                   tileColor: Colors.indigo[100], title: Text(birds['practice']['description'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),), 
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(birds['practice']['description1'],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(birds['practice']['description2'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),              
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(birds['practice']['description3'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(birds['practice']['description4'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(birds['practice']['description5'],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(birds['practice']['description6'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(birds['practice']['description7'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(birds['practice']['description8'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(birds['practice']['description9'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
              SizedBox(height: 20,),
              ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100], title: Text(birds['practice']['description10'],style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,),),),
            ],),
            ));
          }     
    )));}
}   
