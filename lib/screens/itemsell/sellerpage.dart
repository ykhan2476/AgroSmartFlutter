import 'package:flutter/material.dart';
import 'package:greengaurd/screens/itemsell/updateitems.dart';
import 'package:greengaurd/utils/utils.dart';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SellerPage extends StatefulWidget {
  @override
  _SellerPageState createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> {

  //database create kiya idhar
  final databaseref = FirebaseDatabase.instance.reference().child('sellproducts');

 // firebase storage create kiya idhar
  FirebaseStorage storage = FirebaseStorage.instance;

 
  

  // String _selectedCategory = '';
  
  
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  
  final _priceController = TextEditingController();
  File? _image;
  String _selectedCategory = 'Crops';
  //image ko store k liye file
 

  final List<String> _categories = [
    'Crops',
    'Tools',
    'Pesticides',
    'Crop Guide Manuals',
    'Machineries',
    'Seeds',
    'vehicles',
    'Fertilisers'
    ,'irrigation'
    ,'Storage',
    'others'
    // Add more categories as needed
  ];

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
    Random random = Random();
    int num1 =random.nextInt(900);
    int num2 =random.nextInt(900);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Product sell'),
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
              TextFormField(controller: _productDescriptionController,
                decoration: InputDecoration(labelText: 'Product Description'),validator: (value) {
                  if (value!.isEmpty) {return 'Please enter a product description';}
                  return null;},),


                  DropdownButtonFormField<String>(
                value: _selectedCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
                items: _categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Product Category',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a product category';
                  }
                  return null;
                },
              ),


            /*  TextFormField(controller: _productCategoryController,decoration: InputDecoration(labelText: 'Product Category'),
                    validator: (value) {if (value!.isEmpty) {return 'Please enter a product category';}
                  return null;},),*/
              TextFormField(controller: _priceController,decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,validator: (value) {
                  if (value!.isEmpty) { return 'Please enter a price'; }
                  return null;},),

              ElevatedButton( onPressed:() async {
                String id= '${_selectedCategory.toString()}${_productNameController.text.toString()}${num1.toString()}${num2.toString()}';
                final  storageRef =FirebaseStorage.instance.ref('/productimage/'+id);
                 await storageRef.putFile(_image!);
                 // Get the download URL for the uploaded image
                 final String downloadURL =await storageRef.getDownloadURL();
                 
                 print(_selectedCategory.toString());
                 databaseref.child(id).child('product').set(
                  {'productid':id.toString(),
                  'name':_productNameController.text.toString(),
                  'description':_productDescriptionController.text.toString(),
                  'price':_priceController.text.toString(),
                  'category':_selectedCategory.toString(),
                  'image':downloadURL.toString()
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