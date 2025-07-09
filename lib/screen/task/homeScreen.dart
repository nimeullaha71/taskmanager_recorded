import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/component/TaskAppBar.dart';
import 'package:taskmanager_recorded/component/appBottomNav.dart';
import 'package:taskmanager_recorded/component/cancelledTaskList.dart';
import 'package:taskmanager_recorded/component/completedTaskList.dart';
import 'package:taskmanager_recorded/component/newTaskList.dart';
import 'package:taskmanager_recorded/component/progressTaskList.dart';

import '../../utility/utility.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {


  int TapIndex=0;

  Map<String,String>ProfileData={"email":"","firstName":"","lastName":"","photo":DefaultProfilePic};

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

  ReadAppBarData() async {
    String? email = await ReadUserData("email");
    String? firstName = await ReadUserData("firstName");
    String? lastName = await ReadUserData("lastName");
    String? img = await ReadUserData("photo");

    setState(() {
      ProfileData = {
        "email": '$email',
        "firstName": '$firstName',
        "lastName": '$lastName',
        "photo": DefaultProfilePic
      };
    });
  }

  @override
  void initState() {
    ReadAppBarData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskAppBar(context,ProfileData),
      body: widgetOptions.elementAt(TapIndex),
      bottomNavigationBar: appBottomNav(TapIndex,onItemTap),
    );
  }
}
