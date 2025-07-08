import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager_recorded/api/apiClient.dart';
import 'package:taskmanager_recorded/style/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  Map<String,String>FormValues={"email":"","password":""};

  bool loading = false;

  InputOnChange(MapKey,Textvalue){
    setState(() {
      FormValues.update(MapKey, (value)=>Textvalue);
    });
  }

  FormOnSubmit()async{
    if(FormValues['email']!.length==0){
      ErrorToast("Email Required");
    }
    else if(FormValues['password']!.length==0){
      ErrorToast("Password Required");
    }
    else{
      setState(() {
        loading=true;
      });

     bool res = await LoginRequest(FormValues);
     if(res==true){
       Navigator.pushNamedAndRemoveUntil(context, "/", (route)=>false);

     }else {
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
          child: loading ? (Center(child: CircularProgressIndicator(),)):(SingleChildScrollView(
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
                  onChanged: (Textvalue){
                    InputOnChange("email", Textvalue);
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Password"),
                  onChanged: (Textvalue){
                    InputOnChange("password", Textvalue);
                  },
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      FormOnSubmit();
                    },
                    child: SuccessButtonCHild("Login"),

                    style: AppButtonStyle(),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      InkWell(onTap: (){
                        Navigator.pushNamed(context, "/emailVerification");
                      },
                      child: Text("Forget Password?",style: Head7Text(colorLightGray),),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, "/registration");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have a account?",style: Head7Text(colorDarkBlue),),
                            Text("SignUp",style: Head6Text(colorGreen),)
                          ],
                        ),

                      )
                    ],
                  ),
                )
              ],
            ),
          )),
        )
      ],
    ));
  }
}
