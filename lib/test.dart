import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailynewsshorts/firebase/firebase_readdata.dart';
import 'package:dailynewsshorts/widgets/loginbuttons.dart';
import 'package:dailynewsshorts/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:dailynewsshorts/firebase/firebase_readdata.dart';
import 'package:flutter/material.dart';

import 'color_schems.dart';
import 'mainscreen.dart';
class GetUserName extends StatelessWidget {
  final String documentId;
  late String name ;
  late String password ;
  late String lancode;
  late String countrycode;
  GetUserName(this.documentId);
     Data(snapshot)async{
     Map<String, dynamic> data =  await snapshot.data!.data() as Map<String, dynamic>;

     name = await data["Name"];
    // password = await data["password"];
     lancode = await data["languagecode"];
     countrycode = await data["countrycode"];
     return data;

  }


  //late String userpassword;

  @override
  Widget build(BuildContext context) {
bool nodata = true;

    CollectionReference users =   FirebaseFirestore.instance.collection(
        documentId);
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<
              String,
              dynamic>;
          name = data["Name"];
          lancode = data["languagecode"];
          countrycode = data["countrycode"];

          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/0.5,
                    height: MediaQuery.of(context).size.height/03,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey
                    ),
                    child: Column(
                      children: [
                       Text(name),
                        SizedBox(height: 5,),
                        Text(lancode),
                        SizedBox(height: 5,),
                        Text(countrycode),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.arrow_forward),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>newsscreen(languagecode: lancode, user: name, countrycode: countrycode)));
                    },
                  )
                ],
              ),
            ),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
// }
// class GetUserName extends StatefulWidget {
//  final String mail;
//  String name ="" ;
//  String password = "";
//  GetUserName(this.mail);
//
//   @override
//   _GetUserNameState createState() => _GetUserNameState();
// }
//
// class _GetUserNameState extends State<GetUserName> {
//
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection(widget.mail);
//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(widget.mail).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//
//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }
//
//         if (snapshot.hasData && !snapshot.data!.exists) {
//           return Text("Document does not exist");
//         }
//
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
//             widget.name = data["Name"];
//              widget.password = data["password"];
//           // if(password == userpassword){
//           //   Navigator.push(context, MaterialPageRoute(builder: (context)=>newsscreen(languagecode: "en", user: name)));
//           // }
//          // firebasedata(name: name, password: password);
//
//          // return Text("Full Name: ${data['Name']} ${data['password']}");
//         }
//
//         return Text("loading");
//       },
//     );
//   }
// }
