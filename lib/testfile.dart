import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class firebaseverify extends StatefulWidget {
//   late String name;
//   late String password;
//   late String email;
//
//
//   firebaseverify(this.email);
//
//   @override
//   _firebaseverifyState createState() => _firebaseverifyState();
// }
//
// class _firebaseverifyState extends State<firebaseverify> {
//   void verify(password)async{
//
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String name = widget.name ;
//     String password =widget.password;
//     String documentId=widget.email;
//     CollectionReference users =  FirebaseFirestore.instance.collection(
//         documentId);
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
//           Map<String, dynamic> data = snapshot.data!.data() as Map<
//               String,
//               dynamic>;
//           name = data["Name"];
//           password = data["password"];
//           if ( password!=null){
//
//           }
//
//
//           return Text("Full Name: ${data['Name']} ${data['password']}");
//         }
//
//         return Text("loading");
//       },
//     );
//   }
// }




class getuser{

  late String mail;
  late String firebasepass;
   late Map<String,dynamic> data;
  Getuser(mail)async{
   final String pass;
    CollectionReference ref =  FirebaseFirestore.instance.collection(mail);
    DocumentSnapshot snap = await ref.doc(mail).get();
    data = await snap.data() as Map<String,dynamic>;
    print(data["password"]);
    firebasepass =  data["password"];
    // return data;
    if(firebasepass == null){
      firebasepass = data["password"];
    }
    return firebasepass;
  }

  getuser(this.mail);
}