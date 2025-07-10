import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/api/apiClient.dart';
import 'package:taskmanager_recorded/style/style.dart';

class taskCreateScreen extends StatefulWidget {
  const taskCreateScreen({super.key});

  @override
  State<taskCreateScreen> createState() => _taskCreateScreenState();
}

class _taskCreateScreenState extends State<taskCreateScreen> {

  Map<String,String> FormValues={"title":"","description":"","status":"New"};

  bool loading = false;

  InputOnChange(MapKey,TextValue){
    setState(() {
      FormValues.update(MapKey, (value)=>TextValue);
    });
  }

  FormOnSubmit()async{
    if(FormValues['title']!.length==0){
      ErrorToast("Title is Required");
    }
    else if(FormValues['description']!.length==0){
      ErrorToast("Description is Required !");
    }
    else{
      setState(() {
        loading=true;
      });
      bool res = await TaskCreateRequest(FormValues);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, "/", (route)=>false);
      }
      else {
        setState(() {
          loading=false;
        });
      }
      }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: colorGreen, title: Text("Create New Task"),),

      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: loading?(Center(child: CircularProgressIndicator(),)):(
            SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add New Task",style: Head1Text(colorLightGray),),
                  SizedBox(height: 10,),
                  TextFormField(
                    onChanged: (TextValue){
                      InputOnChange("title", TextValue);
                    },
                    decoration: AppInputDecoration("Task Name"),
                  ),

                  SizedBox(height: 10,),

                  TextFormField(
                    onChanged: (TextValue){
                      InputOnChange("description", TextValue);
                    },
                    maxLines: 10,
                    decoration: AppInputDecoration("Info"),
                  ),

                  SizedBox(height: 10,),

                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),

                        onPressed: (){
                        FormOnSubmit();
                        },
                        child: SuccessButtonCHild("Create")),
                  )
                ],
              ),
            )
            ),
          )
        ],
      ),
    );
  }
}