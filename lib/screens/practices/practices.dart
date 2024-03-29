import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greengaurd/components/footer.dart';
import 'package:greengaurd/screens/practices/birds.dart';
import 'package:greengaurd/screens/practices/fields.dart';
import 'package:greengaurd/screens/practices/irrigation.dart';
import 'package:greengaurd/screens/practices/pest.dart';
import 'package:greengaurd/screens/practices/soil.dart';

class practices extends StatefulWidget {
  const practices({super.key});

  @override
  State<practices> createState() => _practicesState();
}

class _practicesState extends State<practices> {

 @override
  Widget build(BuildContext context) {
  double hght = MediaQuery.of(context).size.height;
  double wid = MediaQuery.of(context).size.width;
  

 Agropractice(image,name,func){
   return Container( height:wid*0.54,width: wid*0.92,margin: EdgeInsets.all(5),
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
    ],),); 
 }
List <String> pimage=['assets/images/f1.jpeg','assets/images/f2.jpeg','assets/images/f3.jpeg','assets/images/f4.jpeg','assets/images/f6.jpeg',];
List <String> pname=['SOIL QUALITY AND FERTILITY','PEST MANAGEMENT','IRRIGATION PRACTICES' ,'FIELD','BIRD',];


    return  Scaffold(
       appBar: AppBar(title: Text("Agriculture Factors"),
                      // foregroundColor: Color.fromARGB(252, 12, 2, 2),
                      actions: [IconButton(onPressed: (){}, icon: Icon(Icons.settings_voice))],
                       ), 
       body: SafeArea(child: Column(children:[
        Container(height: hght*0.8,width: wid,color: Color.fromARGB(255, 226, 230, 232),child: 
        SingleChildScrollView(scrollDirection: Axis.vertical,child: Column(children: [       
        SizedBox(height: 20,),
       // for (int i=0;i<5;i++)
        //Agropractice(pimage[i], pname[i], showpractices(pname: pname[i]))
        Agropractice('assets/images/f1.jpeg','SOIL QUALITY AND FERTILITY',soil()), 
        Agropractice('assets/images/f2.jpeg','PEST MANAGEMENT',pest() ),
        Agropractice('assets/images/f3.jpeg','IRRIGATION PRACTICES' ,irrigation() ),
        Agropractice('assets/images/f4.jpeg','FIELD',fields() ),
        Agropractice('assets/images/f6.jpeg', 'BIRD', birds()),
       ])),), 
       footer()
       ])));
  }
}