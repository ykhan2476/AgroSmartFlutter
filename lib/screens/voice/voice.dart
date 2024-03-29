
import 'package:speech_to_text/speech_to_text.dart' as stt;
 import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_langdetect/flutter_langdetect.dart' as langdetect;
import 'dart:convert';
import 'package:http/http.dart' as http;




class voice extends StatefulWidget {
  @override
  voiceState createState() => voiceState();
}
 
class voiceState extends State<voice> {
 late  stt.SpeechToText speech;
  String textString = "Press The Button";
  bool isListen = false;
  final List<Map<String ,String>> messages=[];
  String assistantresponse ="";
  
  Future <String> chatGPTAPI(String prompt) async {
    messages.add({'role': 'user','content': prompt});
     try{
      final res =await http.post(
        Uri.parse("https://api.openai.com/v1/chat/completions"),
        headers: {"Content-Type" : " application/json",
        "Authorization": "Bearer $aikey"},
        body:jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages}));
        print(res.body);
        if (res.statusCode==200){
          String content = jsonDecode(res.body)['choices'][0]['message']['content'];
          content = content.trim();
          messages.add({'role':'assistant','content':content});

          setState(() {
            assistantresponse =content;
          });
          return content;
        }
        return "";
    }catch(e){
      return e.toString();
    }

  }

  void listen() async {
    if (!isListen) {
      bool avail = await speech.initialize();
      if (avail) {
        setState(() {
          isListen = true;
        });
        speech.listen(onResult: (value) {
          setState(() {
            textString = value.recognizedWords;
            
          });
        });
      }
    } else {
      setState(() {
        isListen = false;
      });
       final speech1 =await chatGPTAPI(textString);
      speech.stop();
    }
  }
 
  @override
  void initState() {
    super.initState();
    speech = stt.SpeechToText();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speech To Text"),
      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,child:Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Text(
              textString,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
          ),
           Container(margin:EdgeInsets.all(50),child: Text(assistantresponse,style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),),),
          SizedBox(height: 100,)
          
        ],
      ) ,),
      floatingActionButton: AvatarGlow(
        animate: isListen,
        glowColor: Colors.red,
        endRadius: 65.0,
        duration: Duration(milliseconds: 2000),
        repeatPauseDuration: Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          child: Icon(isListen ? Icons.mic : Icons.mic_none),
          onPressed: () {
            listen();
          },
        ),
      ),
    );
  }
}