import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager_recorded/api/apiClient.dart';
import 'package:taskmanager_recorded/style/style.dart';
import 'package:taskmanager_recorded/utility/utility.dart';

class pinVerificationScreen extends StatefulWidget {
  const pinVerificationScreen({super.key});

  @override
  State<pinVerificationScreen> createState() => _pinVerificationScreenState();
}

class _pinVerificationScreenState extends State<pinVerificationScreen> {
  Map<String, String> FormValues = {"otp": ""};
  bool loading = false;

  InputOnChange(MapKey, TextValue) {
    setState(() {
      FormValues.update(MapKey, (value) => TextValue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['otp']!.length == 0) {
      ErrorToast("Pin is Required");
    } else {
      setState(() {
        loading = true;
      });
      String? emailAddress = await ReadUserData('EmailVerification');
      bool res = await VerifyOTPRequest(emailAddress, FormValues['otp']);
      if (res == true) {
        Navigator.pushNamed(context, '/setPassword');
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
              padding: EdgeInsets.all(36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pin Verification",
                    style: Head1Text(colorDarkBlue),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "A 6 digit verification pin will send to your \nemail address",
                    style: Head6Text(colorDarkBlue),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    pinTheme: AppOTPStyle(),
                    animationType: AnimationType.fade,
                    animationDuration: Duration(microseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {},
                    onChanged: (value) {
                      InputOnChange("otp", value);
                    },
                  ),
                  Container(
                      child: ElevatedButton(
                          style: AppButtonStyle(),
                          onPressed: () {
                            FormOnSubmit();
                          },
                          child: SuccessButtonCHild("Verify")))
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
