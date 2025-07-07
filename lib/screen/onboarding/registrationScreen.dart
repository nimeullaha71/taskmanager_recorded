import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/api/apiClient.dart';
import 'package:taskmanager_recorded/style/style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {

  Map<String,String>FormValues={"email":"","firstName":"","lastName":"","mobile":"","password":"","photo":"","cpassword":""};
  bool loading = false;

  InputOnChange(Mapkey,TextValue){
    setState(() {
      FormValues.update(Mapkey, (value)=>TextValue);
    });
  }

  FormOnSubmit()async{
    if(FormValues['email']!.length==0){
      ErrorToast("Email Required");
    }
    else if(FormValues['firstName']!.length==0){
      ErrorToast("First Name is required");
    }
    else if(FormValues['lastName']!.length==0){
      ErrorToast("Last Name id required");
    }
    else if(FormValues['mobile']!.length==0){
      ErrorToast("mobile is required");
    }
    else if(FormValues['password']!.length==0){
      ErrorToast("password is required");
    }
    else if(FormValues['password']!=FormValues['cpassword']){
      ErrorToast("password don't match");
    }
    else{
      setState(() {
        loading=true;
      });
      bool res = await RegistrationRequest(FormValues);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route)=>false);
      }
      else{
        setState(() {
          loading=false;
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
          SingleChildScrollView(
            child: loading?(Center(child: CircularProgressIndicator(),)):(
                Container(
                  margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Join with Us",
                        style: Head1Text(colorDarkBlue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: AppInputDecoration("Email"),
                        onChanged: (TextValue){
                          InputOnChange("email", TextValue);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: AppInputDecoration("First Name"),
                        onChanged: (TextValue){
                          InputOnChange("firstName", TextValue);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: AppInputDecoration("Last Name"),
                        onChanged: (TextValue){
                          InputOnChange("lastName", TextValue);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: AppInputDecoration("Mobile"),
                        onChanged: (TextValue){
                          InputOnChange("mobile", TextValue);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: AppInputDecoration("password"),
                        onChanged: (TextValue){
                          InputOnChange("password", TextValue);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: AppInputDecoration("cpassword"),
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
                          child: SuccessButtonCHild("Registration"),
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
