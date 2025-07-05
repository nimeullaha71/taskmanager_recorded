import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/style.dart';

class emailVerificationScreen extends StatefulWidget {
  const emailVerificationScreen({super.key});

  @override
  State<emailVerificationScreen> createState() => _emailVerificationScreenState();
}

class _emailVerificationScreenState extends State<emailVerificationScreen> {
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

                Text("Your Email Address",style: Head1Text(colorDarkBlue),),
                SizedBox(height: 5,),
                Text("A 6 digit pin will send to your \nemail Address"),
                SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration("email"),),
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
