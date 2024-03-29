

import 'package:greengaurd/screens/authentication/registration.dart';
import 'package:greengaurd/screens/home/home.dart';
import 'package:greengaurd/utils/utils.dart';
import 'package:greengaurd/widgets/headings.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}
 final sc = GlobalKey<FormState>();
 TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();



class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {

   //FIREBASE AUTH FOR AUTHENTICATION and accessing apis in firebase
  FirebaseAuth _auth = FirebaseAuth.instance;

  //formkey and textcontrollers for form 
  
 

  //height and width
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    
    
    return Scaffold(
      
  body:SingleChildScrollView(scrollDirection: Axis.vertical,child:
    Container(decoration:  BoxDecoration(image:DecorationImage(image:AssetImage('',))),
     child:Column(children:[
      SizedBox(height: 20,),
      SizedBox(height: 50,child:headings(text1:"LOGIN") ,),
      SizedBox(height: 20,),
      Form(
      key:sc,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Email',prefixIcon: Icon(Icons.email)
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _password,
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Password',prefixIcon: Icon(Icons.password)
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (sc.currentState!.validate()) {
                  _auth.signInWithEmailAndPassword(
                      email: _email.text.toString(),
                      password:_password.text.toString()).then((value) {
                        Utils().toastmessage('LOGIN SUCCESSFULL! ');
                        
                        
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> home()));
                      }).onError((error, stackTrace) {
                        Utils().toastmessage(error.toString());});
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    ),
    SizedBox(height: 20,),
    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
      SizedBox(child: TextButton(onPressed: (){}, child:Text('forget password'))),
      Row(children: [
         SizedBox(child: Text("don't have an account?"),),
      SizedBox(child: TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const registration()));},
       child:Text('Sign up')))
      ],),
     
    ],),
    SizedBox(height: 20,),
  
      ],)),
    )
    )
    ;
  }
}