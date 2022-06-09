

import 'package:dailynewsshorts/screens/language%20selection%20screen.dart';
import 'package:dailynewsshorts/screens/logins/login_screen.dart';
import 'package:dailynewsshorts/widgets/textfield.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../color_schems.dart';
import '../../firebase/firebase_login_user.dart';
import '../../widgets/loginbuttons.dart';

class signupscreen extends StatefulWidget {
  const signupscreen({Key? key}) : super(key: key);

  @override
  _signupscreenState createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
  final app = Firebase.initializeApp();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool correctpass = true;
  bool hinttext = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "SIGN UP",
                      style: TextStyle(
                          color: letter, fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child:
                            textfield(email: name, hint: "Enter your Name")), //name
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: textfield(
                            email: email, hint: "Enter your Email")), //email
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: textfield(
                            email: password, hint: "Enter  password")), //password
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: textfield(
                            email: confirmpassword,
                            hint: hinttext?"Confirm password":"Wrong Password",
                          color: correctpass?letter:Colors.red,
                        ),
                    ), //confirm password
                   SizedBox(
                     height: 20,
                   ),
                    GestureDetector(
                      onTap: (){
                        //print(email.text);
                        //print(password.text);
                       setState(() {
                         if (password.text!=confirmpassword.text){
                           confirmpassword.clear();

                           correctpass = false;
                           hinttext = false;

                         }
                        else{
                          String username = name.text;
                           String useremail = email.text;
                           String userpassword = password.text;
                          // firebaselogin signupval =  firebaselogin(email: useremail, password: userpassword,name: username);

                         //  signupval.loginauth();
                          // signupval.adduser();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => language_selection(username:username,mail: useremail,password: userpassword,)));
                         }
                       });
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width/1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: buttoncolor,
                        ),
                        child: Center(child: Text('Sign up',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("--------------------",style: TextStyle(color: letter),),
                        Text('OR',style: TextStyle(color: letter,fontSize: 20),),
                        Text("--------------------",style: TextStyle(color: letter),),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        loginbuttons(title: "G+",color: googlebutton,),
                        SizedBox(
                          width: 30,
                        ),
                        loginbuttons(title: "f", color:facebookblue ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have a account",style: TextStyle(color: letter,fontSize: 15),),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>loginscreen()));
                        print("loginscreen");
                      },
                      child: Text("Login",style: TextStyle(color: red,fontSize: 15),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
