import 'package:flutter/material.dart';

import '../api/apiClient.dart';
import '../style/style.dart';
import 'TaskList.dart';

class cancelTaskList extends StatefulWidget {
  const cancelTaskList({super.key});

  @override
  State<cancelTaskList> createState() => _cancelTaskListState();
}

class _cancelTaskListState extends State<cancelTaskList> {

  List TaskItems=[];
  bool loading = true;
  String status ="Cancel";

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData()async{
    var data = await TaskListRequest("Cancel");
    setState(() {
      loading=false;
      TaskItems=data;
    });
  }

  DeleteItem(id)async{
    showDialog(

        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Delete"),
            content: Text("Once Delete ,You can't get it back"),
            actions: [
              OutlinedButton(

                onPressed: ()async{
                  Navigator.pop(context);
                  setState(() {
                    loading=true;
                  });
                  await TaskDeleteRequest(id);
                  await CallData();
                },
                child: Text("Yes"),
              ),
              OutlinedButton(

                  onPressed: ()async{
                    Navigator.pop(context);

                  },
                  child: Text("No")
              ),

            ],
          );
        }
    );
  }

  UpdateStatus(id)async{
    setState((){
      loading=true;
    });
    await TaskUpdateRequest(id, status);
    await CallData();
    setState((){
      status = "Cancel";
    });
  }



  StatusChange(id)async{
    showModalBottomSheet(
        context: context,
        builder: (context){
          return StatefulBuilder(

              builder: (BuildContext context,StateSetter setState){
                return Container(
                  padding: EdgeInsets.all(30),
                  height: 328,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RadioListTile(title: Text("New"), value: "New", groupValue: status,
                          onChanged: (value){
                            setState((){
                              status = value.toString();
                            });
                          }),
                      RadioListTile(title: Text("Progress"), value: "Progress", groupValue: status,
                          onChanged: (value){
                            setState((){
                              status = value.toString();
                            });
                          }),
                      RadioListTile(title: Text("Completed"), value: "Completed", groupValue: status,
                          onChanged: (value){
                            setState((){
                              status = value.toString();
                            });
                          }),
                      RadioListTile(title: Text("Cancel"), value: "Cancel", groupValue: status,
                          onChanged: (value){
                            setState((){
                              status = value.toString();
                            });
                          }),


                      Expanded(
                        child: Container(
                          child: ElevatedButton(
                              style: AppButtonStyle(),
                              onPressed: (){
                                Navigator.pop(context);
                                UpdateStatus(id);
                              },
                              child: SuccessButtonCHild('Confirm')),
                        ),
                      )
                    ],

                  ),
                );
              }
          );
        }
    );
  }



  @override
  Widget build(BuildContext context) {
    return loading?(Center(child: CircularProgressIndicator(),)):(RefreshIndicator(
      onRefresh: ()async{
        await CallData();
      }, child: TaskList(TaskItems,DeleteItem,StatusChange)
    ));
  }
}

