import 'package:dailynewsshorts/mainscreen.dart';
import 'package:dailynewsshorts/screens/Country_selection_screen.dart';
import 'package:dailynewsshorts/screens/first_screen.dart';
import 'package:dailynewsshorts/screens/language%20selection%20screen.dart';
import 'package:dailynewsshorts/screens/logins/forgotpassword.dart';
import 'package:dailynewsshorts/screens/logins/login_screen.dart';
import 'package:dailynewsshorts/screens/signup/signup%20screeen.dart';
import 'package:dailynewsshorts/test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'color_schems.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(newsapp());
}

class newsapp extends StatefulWidget {
  const newsapp({Key? key}) : super(key: key);

  @override
  _newsappState createState() => _newsappState();
}

class _newsappState extends State<newsapp> {

  @override
  void firebase()async{
    final app =   await Firebase.initializeApp();
    final auth = FirebaseAuth.instance;
  }
  void initState() {
    // TODO: implement initState

    super.initState();
   firebase();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(primary: letter)
      ),
      home: waitingscreen()// countryselection(username: "name" ,lancode: "en",password: "123456789", mail: '12345@gmail.com',),//loginscreen()//newsscreen(languagecode: "ru",country: "in",user: "lordwham",),
    );
  }
}
