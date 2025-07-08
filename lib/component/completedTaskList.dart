import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/api/apiClient.dart';

import 'TaskList.dart';

class completedTaskList extends StatefulWidget {
  const completedTaskList({super.key});

  @override
  State<completedTaskList> createState() => _completedTaskListState();
}

class _completedTaskListState extends State<completedTaskList> {

  List TaskItems=[];
  bool loading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData()async{
    var data = await TaskListRequest("Completed");
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
