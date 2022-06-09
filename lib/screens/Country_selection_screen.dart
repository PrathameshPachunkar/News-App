import 'package:dailynewsshorts/firebase/firebase_login_user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../color_schems.dart';
import '../mainscreen.dart';


class countryselection extends StatefulWidget {
late String lancode;
late String username;
late String mail;
late String password;
countryselection({required this.lancode, required this.username,required this.mail,required this.password});

  @override
  _countryselectionState createState() => _countryselectionState();
}

class _countryselectionState extends State<countryselection> {
  List countries =[
    "Saudi Arabia",
    "Germany",
    "France",
    "India",
    "Russia",
    "China",
    "United States",
    "Italy"
  ];
  List countrycodes =[
   "sa",
    "de",
    "fr",
    "in",
    "ru",
    "cn",
    "us",
    "it",
  ];
  @override
  Widget build(BuildContext context) {
    String languagecode = widget.lancode;
    String username= widget.username;
    String mail = widget.mail;
    String password = widget.password;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: red,
        centerTitle: true,
        title:Text("Select Country",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),) ,
      ),
      body:  Container(
        child:
        ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: () async {
                 print(countrycodes[index]);
                  final pref = await SharedPreferences.getInstance();
                  pref.setString("preferdlanguage", languagecode);
                  pref.setString("username", username);
                  pref.setString("countrycode", countrycodes[index]);
                  String? prefs = pref.getString("preferdlanguage");
                  //print(prefs);
                 final user = firebaselogin(email: mail, password: password, name: username, countrycode: countrycodes[index], languagecode: languagecode);

                    user.loginauth();
                    user.adduser();

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>newsscreen(languagecode: languagecode,user: username,countrycode:countrycodes[index])));


                 // print(languagecodes[index]);
                },
                child: Container(
                  child: Center(
                    child: Text(countries[index],style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    )),
                  ),
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 2,indent:5 ,),
            itemCount: countries.length),//List for languages
      ),
    ) ;
  }
}
