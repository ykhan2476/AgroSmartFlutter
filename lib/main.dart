import 'package:flutter/material.dart';
import 'package:greengaurd/components/theme.dart';
import 'package:greengaurd/screens/authentication/splash.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(name: 'ggd',options: FirebaseOptions(
    ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Flutter Demo',
      theme: theme(),
      home: const splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}


