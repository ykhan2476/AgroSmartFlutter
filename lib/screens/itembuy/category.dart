
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:greengaurd/components/footer.dart';
import 'package:greengaurd/screens/home/home.dart';
import 'package:greengaurd/screens/itembuy/cart.dart';
import 'package:greengaurd/screens/itembuy/wishlist.dart';
import 'package:greengaurd/widgets/headings.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';


class category extends StatefulWidget {
 
   category({super.key});

  @override 
  State<category> createState() => _categoryState();
}


class _categoryState extends State<category> {
  final ref = FirebaseDatabase.instance.reference().child('sellproducts');
TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;

    return Scaffold(
       appBar: AppBar(title: Text('Products') ,
                       foregroundColor: Color.fromARGB(252, 12, 2, 2),
                      actions: [
                        IconButton( icon: Icon(Icons.favorite),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>wishList()));
                      }),
                      IconButton( icon: Icon(Icons.shopping_cart),
                        onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>cart()));
                      }),
                      ],
                       ), 
    
       body:Container(color: Color.fromARGB(255, 226, 230, 232),child: FirebaseAnimatedList(
        query: ref, shrinkWrap: true,itemBuilder: (context, snapshot, animation, index) {
          Map products = snapshot.value as Map;
          products['key']=snapshot.key;
          print(products);
          return GestureDetector(
            onTap: () {Navigator.push(context,MaterialPageRoute(builder: (_) =>home()));},
            child:Container(height: wid*0.5,width:wid*0.95,margin: EdgeInsets.all(10) ,
                decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10),color: Colors.white),
            child:Row(children: [
              Container(height: wid*0.5,width: wid*0.35,clipBehavior: Clip.antiAlias,decoration: BoxDecoration(borderRadius
              :BorderRadiusDirectional.only(topStart:Radius.circular(10),bottomStart: Radius.circular(10))),
                  child: Image.network('${products['product']['image']}',fit: BoxFit.cover,),),
              Column(children: [
                Container(height: wid*0.27,width: wid*0.5,
                  child: ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100],
                  trailing: IconButton(icon: Icon( Icons.favorite,color: Colors.red[900], ),onPressed: () {},),
                  title: Text(products['product']['name'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
                  subtitle: Text(products['product']['description'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                  ), ),
                Container(height: wid*0.23,width: wid*0.55,
                  child: ListTile(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white,),borderRadius: BorderRadius.circular(10),),
                  tileColor: Colors.indigo[100],
                  leading: IconButton(icon: Icon( Icons.shopping_bag,color: Color.fromARGB(255, 55, 52, 52), ),onPressed: () {},),
                  title: Text(products['product']['category'] ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                  subtitle: Text('Rs.${products['product']['price']}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
                  ), ), 
                  ],),
              
            ]
            ,)));
          })
         
          ));

          
             
    }

       

          }
      
              
