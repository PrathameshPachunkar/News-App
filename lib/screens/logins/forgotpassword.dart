import 'package:flutter/material.dart';

import '../../color_schems.dart';
import '../../widgets/textfield.dart';


class forgotpassword extends StatefulWidget {
  const forgotpassword({Key? key}) : super(key: key);

  @override
  _forgotpasswordState createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Forgot password",style: TextStyle(color: letter,fontSize: 40,fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),

            Text("A reset link will be sent to your email",style: TextStyle(color: letter,fontSize: 10,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 20,
            ),

            Container(
              height: 60,
              width: MediaQuery.of(context).size.width/1.2,
              child: textfield(email: email,hint: "Enter your email",),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                print(email);
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width/1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: buttoncolor,

                ),
                child: Center(child: Text('Send email',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
