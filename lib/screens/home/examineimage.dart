import 'package:flutter/material.dart';
import 'package:greengaurd/widgets/headings.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class examineimage extends StatefulWidget {
  @override
  _examineimageState createState() => _examineimageState();
}

class _examineimageState extends State<examineimage> {
  final _formKey = GlobalKey<FormState>();
  File? _image;
 


  Future<void> _getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
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
  

  void _navigateToNextScreen() {
    // Implement navigation logic to move to the next screen
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>examineimage()));
  }

  @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
     
    return Scaffold(
      appBar: AppBar(
        title: Text('EXAMINE YOUR CROPS'),
      ),
      body: SafeArea(child: Container(height: hght*0.9,color:  Color.fromARGB(255, 226, 230, 232),child: SingleChildScrollView(scrollDirection: Axis.vertical,padding: const EdgeInsets.all(25.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
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
       
         Container(height: hght*0.05,width: wid*0.95,child:Text('DESCRIPTION',style: TextStyle(color: Colors.deepPurple,fontSize: 30),) ,),

                  Container(
                    height:
                        400, // Increased height for the description text field
                    width: 400, // Adjust the width as needed
                    child: SingleChildScrollView(
                      child: TextField(
                        maxLines: 100,
                        decoration: InputDecoration(enabledBorder: OutlineInputBorder(),
                          hintText: 'Enter description...',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.all(16.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
      ],),),))
    );
  }
}
