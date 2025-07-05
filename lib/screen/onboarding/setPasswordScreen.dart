import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/style/style.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({super.key});

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: EdgeInsets.all(36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Set Password",style: Head1Text(colorDarkBlue),),
                SizedBox(height: 5,),
                Text("Minimun length password 8 character With \nlater and number combination"),
                SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration("Password"),),
                SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration("Confirm Password"),),
                SizedBox(height: 10,),
                Container(
                  child: ElevatedButton(onPressed: (){}, child: SuccessButtonCHild("Confirm"),style: AppButtonStyle(),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
