import 'package:dailynewsshorts/mainscreen.dart';
import 'package:dailynewsshorts/test.dart';
import 'package:dailynewsshorts/testfile.dart';
import 'package:flutter/material.dart';

class loadingscreen extends StatelessWidget {

  late String enterdpassword;
  late String email;

  loadingscreen({required this.email,required this.enterdpassword});

  @override

  Widget build(BuildContext context) {

    final user = GetUserName(email);
    final User = getuser(email);

    String datapassword = User.firebasepass;
    fetchdata()async{
      datapassword = await User.firebasepass;
      return datapassword;
    }
    if ( datapassword ==null){
      fetchdata() ;
      return Scaffold(
        body: CircularProgressIndicator(),
      );

    }
    else{
      if(datapassword == enterdpassword){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>newsscreen(languagecode: "en", user: "whamy",countrycode: "in",)));
      }
      else{
        print("error");
      }
      return Scaffold(
        body: CircularProgressIndicator(),
      );
    }
  }
}




