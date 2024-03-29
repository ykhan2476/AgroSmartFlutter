import 'package:flutter/material.dart';
import 'package:greengaurd/screens/itemsell/updateitems.dart';
import 'package:greengaurd/utils/utils.dart';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';



class agriculturepractices extends StatefulWidget {
  @override
  _agriculturepracticesState createState() => _agriculturepracticesState();
}

class _agriculturepracticesState extends State<agriculturepractices> {

  //database create kiya idhar



 // firebase storage create kiya idhar
  FirebaseStorage storage = FirebaseStorage.instance;

 
  

  // String _selectedCategory = '';
  
  
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _description = TextEditingController();
  final _description1= TextEditingController();
  final _description2 = TextEditingController();
  final _description3 = TextEditingController();
  final _description4 = TextEditingController();
  final _description5 = TextEditingController();
  final _description6 = TextEditingController();
  final _description7 = TextEditingController();
  final _description8 = TextEditingController();
  final _description9 = TextEditingController();
  final _description10 = TextEditingController();
  File? _image;
  //image ko store k liye file

  Future<void> _getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(()  {
        _image = File(image.path);
        
      });
    }
  }

  Future<void> _captureImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
     final n4ref = FirebaseDatabase.instance.reference().child('Fields');
    Random random = Random();
    int num1 =random.nextInt(900);
    int num2 =random.nextInt(900);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('agriculturepractices'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              (_image != null)  ?   Image.file( _image!,height: 200,width: 200,fit: BoxFit.cover,):
                 Container(height: 200,width: 200,decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadiusDirectional.circular(10)),child: Icon(Icons.camera),),
            SizedBox(height:20,child: Text('Select image from:',style: TextStyle(fontSize: 20),),),
             Row(children: [
                SizedBox(width: 90,),
                IconButton(onPressed: _getImageFromGallery, icon: Icon(Icons.image,size: 50,)),
                SizedBox(width: 30,),
                IconButton(onPressed: _captureImage, icon: Icon(Icons.camera_alt,size: 50,)),
              ],),
              SizedBox(height: 20,),
              
              TextFormField(controller: _productNameController,
                decoration: InputDecoration(labelText: 'Product Name'),validator: (value) {
                  if (value!.isEmpty) {return 'Please enter a product name';}
                  return null;},),
              TextFormField(controller: _description,
                  decoration: InputDecoration(labelText: 'description'),),
              TextFormField(controller: _description1,
                  decoration: InputDecoration(labelText: 'description'),),
              TextFormField(controller: _description2,
                  decoration: InputDecoration(labelText: 'description'),),
              TextFormField(controller: _description3,
                  decoration: InputDecoration(labelText: 'description'),),
              TextFormField(controller: _description4,
                  decoration: InputDecoration(labelText: 'description'),),
              TextFormField(controller: _description5,
                  decoration: InputDecoration(labelText: 'description'),),
              TextFormField(controller: _description6,
                  decoration: InputDecoration(labelText: 'description'),),
              TextFormField(controller: _description7,
                  decoration: InputDecoration(labelText: 'description'),),
              TextFormField(controller: _description8,
                  decoration: InputDecoration(labelText: 'description'),),
              TextFormField(controller: _description9,
                  decoration: InputDecoration(labelText: 'description'),),
              TextFormField(controller: _description10,
                  decoration: InputDecoration(labelText: 'description'),),

              ElevatedButton( onPressed:() async {
                String id= '${_productNameController.text.toString()}${num1.toString()}${num2.toString()}';
                final  storageRef =FirebaseStorage.instance.ref('/productimage/'+id);
                 await storageRef.putFile(_image!);
                 // Get the download URL for the uploaded image
                 final String downloadURL =await storageRef.getDownloadURL();
                 n4ref.child(id).child('practice').set(
                  {'id':id.toString(),
                  'name':_productNameController.text.toString(),
                  'description':_description.text.toString(),
                  'description1':_description1.text.toString(),
                  'description2':_description2.text.toString(),
                  'description3':_description3.text.toString(),
                  'description4':_description4.text.toString(),
                  'description5':_description5.text.toString(),
                  'description6':_description6.text.toString(),
                  'description7':_description7.text.toString(),
                  'description8':_description8.text.toString(),
                  'description9':_description9.text.toString(),
                  'description10':_description10.text.toString(),
                  'image':downloadURL.toString(),
                  }
                  ).then((value) {
                        Utils().toastmessage('product added successfully! ');
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> updateitems()));
                      }).onError((error, stackTrace) {
                        Utils().toastmessage(error.toString());});
                        
                 
          
                },
                  child: Text('Next'),),
            ],
          ),
        ),
      ),
    );
  }
}