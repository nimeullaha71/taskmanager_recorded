import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/api/apiClient.dart';

import '../../style/style.dart';

class emailVerificationScreen extends StatefulWidget {
  const emailVerificationScreen({super.key});

  @override
  State<emailVerificationScreen> createState() =>
      _emailVerificationScreenState();
}

class _emailVerificationScreenState extends State<emailVerificationScreen> {
  Map<String, String> FormValues = {"email": ""};
  bool loading = false;

  InputOnChange(MapKey, TextValue) {
    setState(() {
      FormValues.update(MapKey, (value) => TextValue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['email']!.length == 0) {
      ErrorToast("Email Required");
    } else {
      setState(() {
        loading = true;
      });
      bool res = await VerifyEmailRequest(FormValues['email']);
      if (res == true) {
        Navigator.pushNamed(context, '/pinVerification');
      } else {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text(
                    "Your Email Address",
                    style: Head1Text(colorDarkBlue),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("A 6 digit pin will send to your \nemail Address"),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: AppInputDecoration("email"),
                    onChanged: (TextValue) {
                      InputOnChange('email', TextValue);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        FormOnSubmit();
                      },
                      child: SuccessButtonCHild("Confirm"),
                      style: AppButtonStyle(),
                    ),
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
