import 'package:flutter/material.dart';

import '../api/apiClient.dart';
import 'TaskList.dart';

class cancelTaskList extends StatefulWidget {
  const cancelTaskList({super.key});

  @override
  State<cancelTaskList> createState() => _cancelTaskListState();
}

class _cancelTaskListState extends State<cancelTaskList> {

  List TaskItems=[];
  bool loading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData()async{
    var data = await TaskListRequest("Canceled");
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

