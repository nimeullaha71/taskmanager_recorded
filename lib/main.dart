import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/screen/onboarding/emailVerificationScreen.dart';
import 'package:taskmanager_recorded/screen/onboarding/loginScreen.dart';
import 'package:taskmanager_recorded/screen/onboarding/pinVerificationSCreen.dart';
import 'package:taskmanager_recorded/screen/onboarding/registrationScreen.dart';
import 'package:taskmanager_recorded/screen/onboarding/setPasswordScreen.dart';
import 'package:taskmanager_recorded/screen/onboarding/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task Manager",
      initialRoute: '/pinVerification',
      routes: {
        '/':(context)=>splashScreen(),
        '/login':(context)=>loginScreen(),
        '/registration':(context)=>registrationScreen(),
        '/pinVerification':(context)=>pinVerificationScreen(),
        '/emailVerification':(context)=>emailVerificationScreen(),
        '/setPassword':(context)=>setPasswordScreen(),

      },
    );
  }
}


