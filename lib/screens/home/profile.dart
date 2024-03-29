import 'package:flutter/material.dart';
import 'package:greengaurd/components/footer.dart';
import 'package:greengaurd/components/theme.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

con(text){
  return ListTile(title: Text(text),onTap: (){},trailing: Icon(Icons.arrow_circle_right));
}
List<String> text=['NAME','GMAIL','PHONE NO.','data','data','data','data','data','data','data','data'];
class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),backgroundColor:Color.fromARGB(255, 226, 230, 232), 
        elevation: 0.0,),
      body: Column(children: [
        
      Container(height: hght*0.85,width: wid,color:  Color.fromARGB(255, 226, 230, 232),child: SingleChildScrollView(scrollDirection: Axis.vertical,child: Column(children: [
          SizedBox(height: 10,),
          Container(height: hght*0.25,width: hght*0.25,margin: EdgeInsets.only(left: 10),clipBehavior: Clip.antiAlias,
                   decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(200)),
                   child: Image.asset('assets/images/dp.png',fit: BoxFit.cover,),),
           SizedBox(height: 10,),
          Container(height:hght*0.95,width: wid,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),child: Column(children: [
            SizedBox(height: 20,), for(int i=0;i<text.length;i++)con(text[i]) ,
          ],),),
         
      ],),)),
      
      

      ],),
     
    );
  }
}