

import 'package:greengaurd/screens/authentication/login.dart';
import 'package:greengaurd/utils/utils.dart';
import 'package:greengaurd/widgets/headings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class registration extends StatefulWidget {
  const registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}
final _formKey = new GlobalKey<FormState>();
 TextEditingController _nameController = TextEditingController();
 TextEditingController _emailController = TextEditingController();
 TextEditingController _passwordController = TextEditingController();
class _registrationState extends State<registration> {
  @override
  Widget build(BuildContext context) {
     //FIREBASE AUTH FOR AUTHENTICATION and accessing apis in firebase
    FirebaseAuth _auth = FirebaseAuth.instance;
     double hght = MediaQuery.of(context).size.height;
     double wid = MediaQuery.of(context).size.width;
    return  Scaffold(
      body:SingleChildScrollView(child:Container(decoration:  BoxDecoration(image:DecorationImage(image:AssetImage('',))),
     child:Column(children: [
      SizedBox(height: 20,),
      SizedBox(height: 50,child:headings(text1:"REGISTRATION") ,),
      SizedBox(height: 20,),
      Form(key: _formKey,child: Padding(padding: const EdgeInsets.all(16.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
         TextFormField(controller: _nameController, validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
        SizedBox(height: 16),
        TextFormField(controller: _emailController,keyboardType: TextInputType.emailAddress,validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                // You can add more email validation logic here
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
        SizedBox(height: 16),
        TextFormField(controller: _passwordController,obscureText: true,validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                // You can add more password validation logic here
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
        SizedBox(height: 32),
        ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate() ) {
                  _auth.createUserWithEmailAndPassword(
                    
                    email: _emailController.text.toString(), 
                    password:_passwordController.text.toString() ).then((value) {
                      Utils().toastmessage('SIGNUP SUCCESSFULL!');
                    }).onError((error, stackTrace) {
                      Utils().toastmessage(error.toString());
                    });
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    ),
    TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const login()));}, 
               child:Text(' <-- back to login')),
     
    ]),)
    ));
  }
}