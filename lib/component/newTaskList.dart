import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/api/apiClient.dart';
import 'package:taskmanager_recorded/component/TaskList.dart';
import 'package:taskmanager_recorded/utility/utility.dart';

class newTaskList extends StatefulWidget {
  const newTaskList({super.key});

  @override
  State<newTaskList> createState() => _newTaskListState();
}

class _newTaskListState extends State<newTaskList> {


  List TaskItems = [];
  bool loading = true;

  @override
  void initState() {

    super.initState();
    CallData();
  }


  CallData()async{
    var data = await TaskListRequest("New");
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
