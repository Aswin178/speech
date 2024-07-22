import 'package:flutter/material.dart';
import 'package:speech/const.dart';
import 'package:speech/screens/landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryclr,
      
        useMaterial3: true,
      ),
      home:SpeechLanding()
    );
  }
}

