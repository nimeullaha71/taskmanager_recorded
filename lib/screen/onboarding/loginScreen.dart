import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/style/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ScreenBackground(context),
        Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Get Started With",
                style: Head1Text(colorDarkBlue),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Learn with Rabbil Hasan",
                style: Head6Text(colorLightGray),
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
                decoration: AppInputDecoration("Password"),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {},
                  child: SuccessButtonCHild("Login"),
                  style: AppButtonStyle(),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
