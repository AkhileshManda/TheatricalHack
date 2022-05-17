import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:theatre_buddy/screens/app/intro_page.dart';
import 'package:theatre_buddy/screens/auth/sign_in.dart';

void main() async{
  //initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: const IntroScreen()
    );
  }
}
