import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/component/appBottomNav.dart';
import 'package:taskmanager_recorded/component/cancelledTaskList.dart';
import 'package:taskmanager_recorded/component/completedTaskList.dart';
import 'package:taskmanager_recorded/component/newTaskList.dart';
import 'package:taskmanager_recorded/component/progressTaskList.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  int TapIndex=0;

  onItemTap(int index){
    setState(() {
      TapIndex = index;
    });
  }
  
  final widgetOptions=[
    newTaskList(),
    progressTaskList(),
    completedTaskList(),
    cancelTaskList(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widgetOptions.elementAt(TapIndex),
      bottomNavigationBar: appBottomNav(TapIndex,onItemTap),
    );
  }
}
