import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/screen/onboarding/emailVerificationScreen.dart';
import 'package:taskmanager_recorded/screen/onboarding/loginScreen.dart';
import 'package:taskmanager_recorded/screen/onboarding/pinVerificationSCreen.dart';
import 'package:taskmanager_recorded/screen/onboarding/registrationScreen.dart';
import 'package:taskmanager_recorded/screen/onboarding/setPasswordScreen.dart';
import 'package:taskmanager_recorded/screen/onboarding/splashScreen.dart';
import 'package:taskmanager_recorded/screen/task/homeScreen.dart';
import 'package:taskmanager_recorded/component/newTaskList.dart';
import 'package:taskmanager_recorded/utility/utility.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String ? token = await ReadUserData("token");

  if(token==null){
    runApp( MyApp("/login"));
  }
  else{
    runApp( MyApp("/"));
  }
}

class MyApp extends StatelessWidget {
  final String FirstRoute;
   MyApp(this.FirstRoute);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      initialRoute: FirstRoute,
      routes: {
        '/':(context)=>homeScreen(),
        '/login':(context)=>loginScreen(),
        '/registration':(context)=>registrationScreen(),
        '/pinVerification':(context)=>pinVerificationScreen(),
        '/emailVerification':(context)=>emailVerificationScreen(),
        '/setPassword':(context)=>setPasswordScreen(),


      },
    );
  }
}


