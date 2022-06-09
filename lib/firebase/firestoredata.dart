// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dailynewsshorts/firebase/firebase_readdata.dart';
// import 'package:dailynewsshorts/widgets/loginbuttons.dart';
// import 'package:dailynewsshorts/widgets/textfield.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:dailynewsshorts/firebase/firebase_readdata.dart';
// import 'package:flutter/material.dart';
//
// import '../mainscreen.dart';
//
// class getfirestoredata extends StatefulWidget {
// String documentid;
//
//
// getfirestoredata(this.documentid);
//
//   @override
//   _getfirestoredataState createState() => _getfirestoredataState();
// }
//
// class _getfirestoredataState extends State<getfirestoredata> {
//   String name = "...Loading";
//   String langaugecode = "en";
//   String countrycode = "in";
//
//   // void firestoredata(){
//   //    FirebaseFirestore.instance.collection(widget.documentid).doc(widget.documentid).get().then((value) {
//   //
//   //    });
//
// Future data(){
//   final user =  FirebaseFirestore.instance.collection(widget.documentid).doc(widget.documentid).get();
// }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(documentId).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }
//
//         if (snapshot.hasData && !snapshot.data!.exists) {
//           return Text("Document does not exist");
//         }
//
//         if (snapshot.connectionState == ConnectionState.done) {
//           // Map<String, dynamic> data = snapshot.data!.data() as Map<
//           //     String,
//           //     dynamic>;
//           // name = data["Name"];
//           // password = data["password"];
//           // lancode = data["languagecode"];
//           // countrycode = data["countrycode"];
//
//           return CircularProgressIndicator();
//         }
//         if(snapshot.data!=null){
//           Map<String, dynamic> data = snapshot.data!.data() as Map<
//               String,
//               dynamic>;
//
//           name = data["Name"];
//
//           langaugecode = data["languagecode"];
//           countrycode = data["countrycode"];
//
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>newsscreen(languagecode: lancode, user:name, countrycode: countrycode)));
//           return CircularProgressIndicator();
//
//         }
//         else
//         {
//           print("not data found");
//           return CircularProgressIndicator();
//         }
//
//         return CircularProgressIndicator();
//       },
//     );;
//   }
// }
