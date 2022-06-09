import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginbuttons extends StatelessWidget {
  late String title ;
  late Color color;
  loginbuttons({required this.title,required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(title);
      },
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
        ),
        child: Center(child: Text(title,style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w900),)),
      ),
    );
  }


}//signup button left