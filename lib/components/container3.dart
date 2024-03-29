import 'package:flutter/material.dart';
import 'package:greengaurd/components/theme.dart';
import 'package:greengaurd/screens/home/home.dart';

class con3 extends StatefulWidget {
  String? image,promoHead,promotag,promocode;
  con3({super.key,this.image,this.promotag,this.promocode});

  @override
  State<con3> createState() => _con3State();
}
class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path=Path();
   path.lineTo(60, 0);     //isme  0 left se start hota h and y axis neeche ki taraf
   path.lineTo(0, size.height);
   path.lineTo(size.width, size.height);
   path.lineTo(size.width, 0); 
    return path;  
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; 
  }
}
class _con3State extends State<con3> {


  @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Container(decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(7),color:theme().primaryColor),
      height:wid*0.45,width: wid*0.9,margin: EdgeInsetsDirectional.all(5),
      child: Row(children: [
            Stack(children: [
                 Column(children: [
                     SizedBox(height: 20,),
                      Container(height:wid*0.2,width: wid*0.47,margin: EdgeInsets.only(left:10),
                              decoration:BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10) ),
                              child: Text('${widget.promotag}',style:TextStyle(fontSize: 20,color: Colors.white))),
                      Container(height:wid*0.1,width: wid*0.47,margin: EdgeInsets.only(left:10),
                              decoration:BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10) ),
                              child: Text('Key objectives: ${widget.promocode}',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white))),        
                              ],),
                 Column(children: [Container(height: wid*0.45,width: wid*0.5,
                        child:IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>home()))                    
                       ,icon: Icon(Icons.arrow_circle_right,size: 30,color: Colors.blue.withOpacity(0),)) ,)],),
                   ],),
             Column(children: [ClipPath(child:Container(height: wid*0.45,width: wid*0.4,clipBehavior: Clip.antiAlias,decoration:BoxDecoration(borderRadius: BorderRadius.only(topRight:Radius.circular(7),bottomRight: Radius.circular(7)))
                               ,child: Image.asset('${widget.image}',fit: BoxFit.cover,),) ,clipper:CustomClipPath(),)],),]));
  }
}