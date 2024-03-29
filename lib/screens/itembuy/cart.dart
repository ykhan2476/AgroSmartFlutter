
import 'package:flutter/material.dart';
import 'package:greengaurd/components/footer.dart';


class cart extends StatefulWidget {
  
   
   cart({super.key});

  @override
  State<cart> createState() => _Screen2State();
}

class _Screen2State extends State<cart> {
  @override
  add_cart(hght,wid,img,name,cost,qty){
     return Container(margin: EdgeInsets.all(10),decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255),borderRadius:BorderRadiusDirectional.circular(20)),child: Column(children: [
        Row(children: [Container(margin: EdgeInsets.all(5),decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),height: hght*0.1,width:hght*0.1,clipBehavior: Clip.antiAlias,child:Image.asset(img,fit: BoxFit.cover,)),
               Column(children: [
                 Container(height: hght*0.05,width: wid*0.4,margin: EdgeInsets.only(top: 20),child: Text(name,style: TextStyle(fontSize: 20),),),
               Container(height: hght*0.05,width: wid*0.4,margin: EdgeInsets.only(left:5),child: Text('cost: ${cost}',style: TextStyle(fontSize: 20),),),
               ],),
              Container(height: hght*0.1,width: wid*0.05,child: TextButton(onPressed: (){}, child: Text('-')),),
              Container(height: hght*0.1,width: wid*0.15,child: TextButton(onPressed: (){}, child: Text(qty)),),
             Container(height: hght*0.1,width: wid*0.05,child: TextButton(onPressed: (){}, child: Text('+')),)],)

     ],),);
  }


  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
     List prodimage=['assets/images/pizza.png','assets/images/burger.png','assets/images/chowmin.jpg',];
    List prodname=['PIZZA','BURGER','CHOWMIN'];
    List prodcost=['200','150','120'];
    List qty=['1','2','1'];
    return Scaffold(
      appBar: AppBar(title: Text('Cart'),
                      
                       foregroundColor: const Color.fromARGB(115, 12, 2, 2),
                       
                       ),
     
      body:Column(children: [
        Container(height:hght*0.8,width: wid,color: Color.fromARGB(255, 226, 230, 232),child: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(children: [
                for(int i =0;i<prodname.length;i++)add_cart(hght,wid,prodimage[i],prodname[i],prodcost[i],qty[i]),

                Container(height:hght*0.06,width:wid*0.9,margin:EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.white,borderRadius :BorderRadius.circular(10),),child: Row(children: [
                        Container(height: hght*0.1,width: wid*0.49,decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(20)),child: Text('Coupan discount'),),
                        Container(height: hght*0.05,width: wid*0.4,decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10),color: Colors.blue,),child:ElevatedButton(onPressed: (){}, child: Text('Apply')),)],)), 
                        
                Container(height:hght*0.05,width:wid*0.9,margin: EdgeInsets.only(left:20),child: Row(children: [
                        Container(height: hght*0.1,width: wid*0.6,child: Text('Cart Total'),),
                        Container(height: hght*0.1,width: wid*0.3,child: Text('470'),)],), 
                        ),
                Container(height:hght*0.05,width:wid*0.9,margin: EdgeInsets.only(left:20),child: Row(children: [
                        Container(height: hght*0.1,width: wid*0.6,child: Text('Tax'),),
                        Container(height: hght*0.1,width: wid*0.3,child: Text('15'),)],), 
                        ),
                Container(height:hght*0.05,width:wid*0.9,margin: EdgeInsets.only(left:20),child: Row(children: [
                        Container(height: hght*0.1,width: wid*0.6,child: Text('Delivery'),),
                        Container(height: hght*0.1,width: wid*0.3,child: Text('50'),)],),
                        ),
                Container(height:hght*0.05,width:wid*0.9,margin: EdgeInsets.only(left:20),child: Row(children: [
                        Container(height: hght*0.1,width: wid*0.6,child: Text('Coupon discount'),),
                        Container(height: hght*0.1,width: wid*0.3,child: Text('50'),)],), 
                        ),
                Container(height:hght*0.05,width:wid*0.9,margin: EdgeInsets.only(left:20),decoration: BoxDecoration(border:Border(top:BorderSide())),child: Row(children: [
                        Container(height: hght*0.1,width: wid*0.6,child: Text('Subtotal'),),
                        Container(height: hght*0.1,width: wid*0.3,child: Text('485'),)],), 
                        ),
                Container(height:hght*0.05,width:wid*0.5,margin: EdgeInsetsDirectional.only(bottom:10),
                    decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(5),),
                    child:ElevatedButton(onPressed: (){}, child: Text('proceed to payment')),),
                              ],),),),
                footer()
                

                 
      ],));
  }
}