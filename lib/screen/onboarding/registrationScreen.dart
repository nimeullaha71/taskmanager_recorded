import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/style/style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
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
                Text(
                  "Join with Us",
                  style: Head1Text(colorDarkBlue),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Email"),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: AppInputDecoration("First Name"),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Last Name"),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Mobile"),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: AppInputDecoration("password"),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: SuccessButtonCHild("Registration"),
                    style: AppButtonStyle(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
