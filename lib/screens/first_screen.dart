import 'dart:async';

import 'package:dailynewsshorts/mainscreen.dart';
import 'package:dailynewsshorts/screens/main_screen.dart';
import 'package:dailynewsshorts/screens/signup/signup%20screeen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class waitingscreen extends StatelessWidget {
//   const waitingscreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           textBaseline: TextBaseline.ideographic,
//           children: [
//             ClipPath(
//               clipper: Clipper(),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height/1.4,
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                 ),
//                 child: Row(children: [
//                   Text('Daily',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
//                   Text('News Shorts',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
//                   Container(
//
//                     child: Image(
//                         colorBlendMode: BlendMode.lighten,
//                         image: AssetImage('lib/assets/Group 1.png')),
//                   ),
//
//                 ],),
//               ),
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
// }
class waitingscreen extends StatefulWidget {
  const waitingscreen({Key? key}) : super(key: key);

  @override
  _waitingscreenState createState() => _waitingscreenState();
}

class _waitingscreenState extends State<waitingscreen> {
  @override
  bool userfound = false;

  void intializeapp() async{

    await  Firebase.initializeApp();
    final checkuser = await FirebaseAuth.instance;

    if(checkuser.currentUser == null){
      print("no user found");
      userfound = false;
      Timer(Duration(seconds: 1),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => signupscreen()
            )
        )
    );//if no user go to signup or login screen

    }// if statement
    else {
      void checkuser() async {
        final pref = await SharedPreferences.getInstance();
        String? name = pref.getString("username");
        String? code = pref.getString("preferdlanguage");
        String? countrycode = pref.getString("countrycode");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>newsscreen(languagecode:code.toString() , user:name.toString(), countrycode: countrycode.toString(), )));
      }
      checkuser();
      userfound = true;
      print("user found");




    }
  }
  void initState() {
    super.initState();
intializeapp();


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column(
          textBaseline: TextBaseline.ideographic,
          children: [
            ClipPath(
              clipper: Clipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.4,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Row(children: [
                  Text('Daily',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('News Shorts',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                  Container(

                    child: Image(
                        colorBlendMode: BlendMode.lighten,
                        image: AssetImage('lib/assets/Group 1.png')),
                  ),

                ],),
              ),
            )

          ],
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var controlPoint1 = Offset(size.width, size.height-100);
    var controlPoint2 = Offset(size.width , 0);
    var endPoint = Offset(size.width, 0);

    Path path = Path()

      ..lineTo(0, size.height - 50)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;

  }

}
