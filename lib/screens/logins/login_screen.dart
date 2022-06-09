import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailynewsshorts/Main_News_Screen/everything.dart';
import 'package:dailynewsshorts/color_schems.dart';
import 'package:dailynewsshorts/firebase/firebase_login_user.dart';
import 'package:dailynewsshorts/firebase/firebase_readdata.dart';
import 'package:dailynewsshorts/loadindscreen.dart';
import 'package:dailynewsshorts/mainscreen.dart';
import 'package:dailynewsshorts/test.dart';
import 'package:dailynewsshorts/testfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../widgets/loginbuttons.dart';
import '../../widgets/textfield.dart';
import 'forgotpassword.dart';

class loginscreen extends StatefulWidget {

  const loginscreen({Key? key}) : super(key: key);

  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  @override



  // void checkuserpass(mail) async{
  //   final dataobj =await GetUserName( mail,);
  //   String userpassword = dataobj.password;
  //   String username = dataobj.name;
  //
  //   if(password == userpassword ){
  //     Navigator.push(context,MaterialPageRoute(builder: (context)=>newsscreen(languagecode: "en" , user: username)));
  //   }
  //   else{
  //     print("error");
  //   }
  //
  // }
void senddata(mail)async{
    final data = readdata( email: mail);
    await data.getdata();
  }
  bool iscorrect = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void getpassword(Password){
    if(Password!=password.text){
      iscorrect = false;
    }
    else{

    }


   }
  getpass(mail,pass) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: mail,
          password: pass
      );

     // Navigator.push(context,MaterialPageRoute(builder: (context)=> newsscreen(languagecode: "en", user: "whamy",countrycode: "in",)));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }

    }
  }
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
                   Container(child: Text("LOG in",style: TextStyle(color: letter,fontSize: 40,fontWeight: FontWeight.w900),)),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: textfield(email: email,hint: "Enter your email",),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: textfield(email: password,hint: "Enter password",),
                    ),
                    Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width/2,
                        ),
                        GestureDetector(
                          onTap: (){
                            print('forgot password');
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>forgotpassword()));
                          },
                          child: Text("Forgot Password?",style: TextStyle(color: Colors.red,fontSize: 10,fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width/1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: buttoncolor,

                        ),
                        child: Center(child: GestureDetector(
                            onTap: () {
                              String pass = password.text;
                              String mail = email.text;
                              Navigator.push(context,MaterialPageRoute(builder: (context)=> GetUserName(mail)));
                             //  senddata(mail);
                             //  // final function = getpass(mail);
                             //  // print(function["password"]);
                             // // final data = fuser.data;
                             // //  print(fuser.firebasepass);
                            // Navigator.push(context,MaterialPageRoute(builder: (context)=> loadingscreen(email: mail, enterdpassword: pass)));

                              //checkuserpass(mail);
                              getpass(mail, pass);
                            },
                            child: Text('Log in',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                    Text("login up using ",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: letter,
                    ),),
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
                  Text("Don't have a account?",style: TextStyle(color: letter,fontSize: 15),),
                  Text("SignUp",style: TextStyle(color: red,fontSize: 15),),
                ],
              ),//row for signup button
            ],
          ),
        ),
      ),
    );
  }
}



