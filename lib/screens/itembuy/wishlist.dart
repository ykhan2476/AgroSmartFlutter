import 'package:flutter/material.dart';

import 'package:greengaurd/components/footer.dart';



class wishList extends StatefulWidget {
  const wishList({super.key});

  @override
  State<wishList> createState() => _wishListState();
}

class _wishListState extends State<wishList> {
  @override
  Widget build(BuildContext context) {
   
    List prodimage=['assets/images/pizza.png','assets/images/burger.png','assets/images/chowmin.jpg',];
    List prodname=['PIZZA','BURGER','CHOWMIN'];
    List prodcost=['200','150','120'];
   
    wish_list(hght,wid,image,name,cost){
     return Container(height: hght*0.25,width:wid,margin: EdgeInsets.all(10),
     decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(20),color: Colors.white),
     child: Row(children: [
              Container(height: hght*0.23,clipBehavior:Clip.antiAlias,width: hght*0.15,margin: EdgeInsets.all(10),decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(20)),child: Image.asset('${image}',fit: BoxFit.cover,),),
              Column(children: [
                Container(height: hght*0.07,width:wid*0.5,margin: EdgeInsets.only(top: 10),child: Text('${name}',style: TextStyle(fontSize: 25),),),
                Container(height: hght*0.05,width:wid*0.5,child: Text('cost: ',style: TextStyle(fontSize: 20),),),
                Container(height: hght*0.045,width:wid*0.5,child: Text('${cost}',style: TextStyle(fontSize: 20),),),
                Container(height: hght*0.07,width:wid*0.55,
                   child:Row(children: [
                      Container(height: hght*0.05,width: wid*0.3,margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10)),
                            child: ElevatedButton(onPressed: (){}, child:Text('Add To Bag')),),
                      Container(height: hght*0.05,width: wid*0.1,margin: EdgeInsets.all(5),
                           decoration: BoxDecoration(color: Color.fromARGB(255, 241, 243, 245),borderRadius: BorderRadiusDirectional.circular(5)),
                          child:IconButton(onPressed: (){}, icon: Icon(Icons.delete)))],) ,)],),
     ],),);
    }  
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Wishlist"),
                       foregroundColor: Color.fromARGB(252, 12, 2, 2),
                      ),
      //drawer: Drawer(child: SingleChildScrollView(scrollDirection: Axis.vertical,child: drawermenu(),),),
      body:SafeArea(child:Column(children: [ 
      Container(height: hght*0.8,width: wid,color:Color.fromARGB(255, 226, 230, 232),child: SingleChildScrollView(scrollDirection:Axis.vertical,child: Column(children: [
           for(int i =0;i<prodname.length;i++)wish_list(hght,wid,prodimage[i],prodname[i],prodcost[i]),],),),),
      Container(height: hght*0.07,width: wid,color: const Color.fromARGB(157, 158, 158, 158),
                child: Row(children: [
      footer()                    
                                                                               
                                                                              ],),)
      ],)),
      
      
      
      
      );
                             
    
  }}