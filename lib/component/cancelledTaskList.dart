import 'package:flutter/material.dart';

class cancelTaskList extends StatefulWidget {
  const cancelTaskList({super.key});

  @override
  State<cancelTaskList> createState() => _cancelTaskListState();
}

class _cancelTaskListState extends State<cancelTaskList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("cancel"),
    );
  }
}

