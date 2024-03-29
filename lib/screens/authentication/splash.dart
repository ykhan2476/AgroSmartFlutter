
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greengaurd/screens/authentication/login.dart';
import 'package:greengaurd/screens/home/home.dart';


class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

   void initState() {
    super.initState();
    _navigatehome();
    //y dusri screen k baad splash screen vps na aane k liye
  }

  _navigatehome() async {
    //firebase auth initialise krega
    FirebaseAuth _auth = FirebaseAuth.instance;
    //currrent user ka data dega
    final user = _auth.currentUser;

    //agar user login h already to app k andar jaega
    if (user != null){
        await Future.delayed(Duration(seconds: 2), () {});
        Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => const home()));
    }
    //varna login screen p jaega
    else{
        await Future.delayed(Duration(seconds: 2), () {});
        Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => const login()));
    }
    
  }
  @override
  Widget build(BuildContext context) {
   double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      body:Stack(children: [
         Container(height: hght,width: wid,child: Image.asset('assets/images/splash.png',fit: BoxFit.cover,),),
        Container(height: wid*0.1,width: wid*0.1,child:Center(child: CircularProgressIndicator(),)),
        
      ],)
    );
  }
}