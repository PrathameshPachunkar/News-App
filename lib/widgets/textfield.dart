import 'package:flutter/material.dart';

import '../color_schems.dart';

class textfield extends StatelessWidget {
  textfield({required this.email, required this.hint,  this.color=  letter});

  late TextEditingController email;
late String hint ;
late Color color ;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: email,
      decoration: InputDecoration(
          hintText: hint,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: color,width: 2),


          )
      ),
    );
  }
}
