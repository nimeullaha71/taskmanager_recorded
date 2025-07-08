import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/api/apiClient.dart';

import 'TaskList.dart';

class progressTaskList extends StatefulWidget {
  const progressTaskList({super.key});

  @override
  State<progressTaskList> createState() => _progressTaskListState();
}

class _progressTaskListState extends State<progressTaskList> {

  List TaskItems = [];
  bool loading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData()async{
    var data = await TaskListRequest("Progress");
    setState(() {
      loading=false;
      TaskItems=data;
    });
  }



  @override
  Widget build(BuildContext context) {
    return loading?(Center(child: CircularProgressIndicator(),)):(RefreshIndicator(
      onRefresh: ()async{
        await CallData();
      }, child: TaskList(TaskItems)
    ));
  }
}
