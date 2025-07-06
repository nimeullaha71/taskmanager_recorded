import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/utility/utility.dart';

class newTaskListScreen extends StatefulWidget {
  const newTaskListScreen({super.key});

  @override
  State<newTaskListScreen> createState() => _newTaskListScreenState();
}

class _newTaskListScreenState extends State<newTaskListScreen> {

  String email="";
  @override
  void initState() {
    CallUserData();
    super.initState();
  }

  CallUserData()async{
   String ? a = await ReadUserData("email");
    setState(() {
      email=a!;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(email),
      ),
    );
  }
}
