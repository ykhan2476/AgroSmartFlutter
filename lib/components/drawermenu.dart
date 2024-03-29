// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:greengaurd/screens/authentication/login.dart';
import 'package:greengaurd/screens/home/examineimage.dart';
import 'package:greengaurd/screens/home/home.dart';
import 'package:greengaurd/screens/home/profile.dart';
import 'package:greengaurd/screens/home/settings.dart';
import 'package:greengaurd/screens/home/weather.dart';
import 'package:greengaurd/screens/itembuy/cart.dart';
import 'package:greengaurd/screens/itembuy/category.dart';
import 'package:greengaurd/screens/itembuy/order.dart';
import 'package:greengaurd/screens/itembuy/wishlist.dart';
import 'package:greengaurd/screens/itemsell/sellerpage.dart';
import 'package:greengaurd/screens/itemsell/updateitems.dart';
import 'package:greengaurd/screens/practices/practices.dart';


class drawermenu extends StatefulWidget {
  
   drawermenu({super.key});

  @override
  State<drawermenu> createState() => _drawermenuState();
}

class _drawermenuState extends State<drawermenu> {
FirebaseAuth _auth = FirebaseAuth.instance;
List<String> items = ['buy items','sell items', ];
String selectedItem = 'buy items';

void handleDropDownItemSelected(String? newValue) {
    setState(() {
      selectedItem = newValue ?? 'sell items'; // Update the selected item globally
    });
  }

Future<void> _signOut() async {
  try {
    await _auth.signOut();
    // The user is now signed out.
  } catch (e) {
    print('Error signing out: $e');
  }
}

list(name,func){
  return TextButton(onPressed: (){
    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>func));
  }, child: Text(name));
}

@override 
Widget build(BuildContext context) {
    
  double hght = MediaQuery.of(context).size.height;
  double wid = MediaQuery.of(context).size.width;
   Widget selectedOptionWidget() {
      if (selectedItem == 'sell items') {
         return Column(children: [
          list('Add products to sell',SellerPage()),
          list('Update products', updateitems()),
        ],);
       
      } 
      else if (selectedItem == 'buy items') {
        return Column(children: [
          list('View Products',category()),
            list('Wishlist', wishList()),
            list('Cart', cart()),
            list('Orders',OrderScreen())

        ],);
        
      } 
      else {return Container();}
    }
 


  return Container(height:hght ,width: wid*0.84,child:SingleChildScrollView(scrollDirection:Axis.vertical,child: Column(children: [ 
    Row(children: [Container(height: hght*0.12,width:wid*0.844,child: Column(children: [Row(children:[
             Container(height:hght*0.06,width:wid*0.2,child: Icon(Icons.agriculture),margin: EdgeInsets.only(bottom: 0),),
             Container(height:hght*0.07,width:wid*0.42,margin: EdgeInsets.only(top: 35), child: Text("GREENGAURD",style:TextStyle(fontSize: 22,),),),
             Container(height:hght*0.07,width:wid*0.2,child: Icon(Icons.close),margin: EdgeInsets.only(bottom: 0),)],),],),)],),
    GestureDetector(onTap:(){ Navigator.of(context).push(MaterialPageRoute(builder:(context)=>profile()));} ,
    child:  Container(height: hght*0.15,width:hght* 0.15,child: Image.asset('assets/images/dp.png',fit: BoxFit.cover,),
         clipBehavior: Clip.antiAlias,decoration: BoxDecoration(color: Colors.black38,borderRadius: BorderRadiusDirectional.circular(200)),),),
    
    Container(height: hght*0.06,width:wid*0.7,child:list('Home',home())),
    Container(height: hght*0.06,width:wid*0.7,child:list('Examine crops',examineimage()),),
    Container(height: hght*0.06,width:wid*0.7,child:list('Weather Forecast',WeatherScreen()),),
    Container(height: hght*0.06,width:wid*0.7,child:list('Agriculture Methods',practices()),),
    Container(height: hght*0.06,width:wid*0.7,child:list('Help',()),),
    Container(height: hght*0.06,width:wid*0.7,child:list('Settings',SettingsScreen()),),
    Container(height: hght*0.06,width:wid*0.7,child:list('terms and conditions',()),),
    Container(padding: EdgeInsets.all(16.0),child: StatefulBuilder(
       builder: (context, setState) {return DropdownButton<String>(value: selectedItem,onChanged:handleDropDownItemSelected,
       items: items.map<DropdownMenuItem<String>>((String item) {return DropdownMenuItem<String>( value: item,child: Text(item),);}).toList(),);},),),
    selectedOptionWidget(),
    ElevatedButton(
      onPressed: ()async{await _signOut();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>login()),);}, 
      child: Text('LOGOUT'))]),));
  }
}






















