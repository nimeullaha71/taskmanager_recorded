import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/api/apiClient.dart';
import 'package:taskmanager_recorded/style/style.dart';
import 'package:taskmanager_recorded/utility/utility.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({super.key});

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
  Map<String, String> FormValues = {
    "email": "",
    "OTP": "",
    "password": "",
    "cpassword": ""
  };

  bool loading = false;

  @override
  void initState() {
    callStoreData();
    super.initState();
  }

  callStoreData() async {
    String? OTP = await ReadUserData("OTPVerification");
    String? Email = await ReadUserData("EmailVerification");
    InputOnChange("email", Email);
    InputOnChange("OTP", OTP);
  }

  InputOnChange(MapKey, TextValue) {
    setState(() {
      FormValues.update(MapKey, (value) => TextValue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['password']!.length == 0) {
      ErrorToast("Password Required");
    } else if (FormValues['password'] != FormValues['cpassword']) {
      ErrorToast("Confirm Password Should be same");
    } else {
      setState(() {
        loading = true;
      });
      bool res = await SetPasswordRequest(FormValues);
      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
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
            padding: EdgeInsets.all(36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Set Password",
                  style: Head1Text(colorDarkBlue),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    "Minimun length password 8 character With \nlater and number combination"),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Password"),
                  onChanged: (TextValue){
                    InputOnChange("password", TextValue);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Confirm Password"),
                  onChanged: (TextValue){
                    InputOnChange("cpassword", TextValue);
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
        ],
      ),
    );
  }
}
