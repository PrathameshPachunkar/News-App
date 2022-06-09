import 'package:dailynewsshorts/color_schems.dart';
import 'package:dailynewsshorts/mainscreen.dart';
import 'package:dailynewsshorts/screens/Country_selection_screen.dart';
import 'package:dailynewsshorts/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class language_selection extends StatelessWidget {
late String username ;
late String mail;
late String password;

language_selection({required this.username,required this.mail,required this.password});

  List languages = [
    "Arabic",
    'German',
    'English',
    'Spanish',
    'French',
    'Hebrew',
    'Italian',
    'Dutch',
    'Norwegian',
    'Portuguese',
    'Russian',
    'Northern Sami',
    'Chinese'
  ];
  List languagecodes = ['ar','de','en','es','fr','he','it','nl','no','pt','ru','se','zh'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: red,
        centerTitle: true,
        title:Text("Language Prefrence",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),) ,
      ),
      body:  Container(
        child:
        ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: () async {
                  final pref = await SharedPreferences.getInstance();
                   pref.setString("preferdlanguage", languagecodes[index]);
                  pref.setString("username", username);
                  String? prefs = pref.getString("preferdlanguage");
                  print(prefs);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>countryselection(lancode: languagecodes[index], username: username,mail: mail,password: password,)));
                 // print(languagecodes[index]);
                },
                child: Container(
                  child: Center(
                    child: Text(languages[index],style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    )),
                  ),
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 2,indent:5 ,),
            itemCount: languages.length),//List for languages
      ),
    ) ;

  }
}
