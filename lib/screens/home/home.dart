
import 'package:flutter/material.dart';

import 'package:greengaurd/components/container2.dart';
import 'package:greengaurd/components/container3.dart';
import 'package:greengaurd/components/drawermenu.dart';
import 'package:greengaurd/components/footer.dart';
import 'package:greengaurd/screens/home/examineimage.dart';
import 'package:greengaurd/screens/home/weather.dart';
import 'package:greengaurd/screens/voice/voice.dart';





class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  GlobalKey<ScaffoldState> scaffState = GlobalKey<ScaffoldState>();
 
TextEditingController _searchController = TextEditingController();
 @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;

 List <String> categoryimages =[
  'assets/images/a1.jpeg',
  'assets/images/a2.jpeg',
  'assets/images/a3.jpeg',
  'assets/images/a4.jpeg',
  'assets/images/a5.jpeg',
  'assets/images/a6.jpeg',
  'assets/images/a7.jpeg',
 ];

 List <String> categoryname =['Tools','seeds','Vehicles','Fertilisers','Pesticides','irrigation','storage'];
List <String> yojnaimage=[
  'assets/images/c1.png',
  'assets/images/c2.png',
  'assets/images/c3.png',];
 List <String> yojnaname =[
      'Pradhan Mantri Krishi Sinchai Yojana (PMKSY)',
      'Paramparagat Krishi Vikas Yojana (PKVY)',
      'Pradhan Mantri Fasal Bima Yojana (PMFBY)',]; 
  List <String> yojnadescript=[
    "Har Khet Ko Pani ,Per Drop More Crop",
    "Cluster-based approach,Financial Help",
    "Premium subsidy,Crop-cutting experiments (CCEs)"];


 prediction(image,name,description,func){
   return Container( height:wid*0.64,width: wid*0.92,margin: EdgeInsets.all(5),
    decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(15),color: Color.fromARGB(255, 255, 254, 254),),
     child:Column(children: [
            Container(height: wid*0.4 ,width:wid*0.92,margin: EdgeInsets.all(5),child: Stack(children: [
              Container( margin:EdgeInsetsDirectional.all(5),height:  wid*0.4,width: wid*0.94,
                         clipBehavior: Clip.antiAlias,decoration:BoxDecoration(borderRadius: BorderRadiusDirectional.circular(15))
                        ,child:Image.asset(image,fit: BoxFit.cover,)),
              Container(height:  wid*0.39,width: wid*0.9,child:IconButton(
                             onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>func))
                        ,icon: Icon(Icons.arrow_circle_right,size: 40,color: Colors.white,)) ,)
                      
            ],),),           
            Container(height: hght*0.03,width:wid*0.85,child: Text(name,style: TextStyle(fontSize: 20,),),),
            Container(height: hght*0.03,margin: EdgeInsets.only(top:1),width:wid*0.85,child: Text(description,style: TextStyle(fontSize: 15),),) ,
    ],),); 
  
 }



    return  Scaffold(
      key: scaffState,
       appBar: AppBar(title: Text("GreenGaurd"),
                       foregroundColor: Color.fromARGB(252, 12, 2, 2),
                      actions: [IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>voice()));
                      }, icon: Icon(Icons.settings_voice))],
                       ), 
       drawer: Drawer(child: SingleChildScrollView(scrollDirection: Axis.vertical,child: drawermenu(),),),
    
       body: SafeArea(child: Column(children:[
        Container(height: hght*0.8,width: wid,color: Color.fromARGB(255, 226, 230, 232),child: 
        SingleChildScrollView(scrollDirection: Axis.vertical,child: Column(children: [
        
        SizedBox(height: 20,),
        SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(children: [
              for(int i=0;i<categoryimages.length;i++) container2(categoryimages: categoryimages[i],categoryname: categoryname[i],)  ],), ),
        SingleChildScrollView(scrollDirection: Axis.horizontal,child:Row(children: [
              for(int i=0;i<yojnaname.length;i++) con3(image: yojnaimage[i],promotag:yojnaname[i],promocode:yojnadescript[i]) ]),),
        prediction("assets/images/examine.png", "Examine your crops",'know health of your crops',examineimage()),
        prediction("assets/images/weather.jpeg",'Weather prediction',"examine weather in your location",WeatherScreen()),
       ])),),
        
       footer()
        
       ])));
     
}}