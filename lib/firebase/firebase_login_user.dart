import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class firebaselogin {
  late String email;
  late String password;
  late String languagecode;
  late String countrycode;
  late var name ;
  late var Error;
  firebaselogin({required this.email, required this.password, required this.name,required this.countrycode,required this.languagecode});
  final auth = FirebaseAuth.instance;

  Future<void> loginauth()async{
    FirebaseFirestore store = FirebaseFirestore.instance;
    //CollectionReference userinfo = FirebaseFirestore.instance.collection(email);// in case of error uncomment this line and delete all documnet refrence
    CollectionReference userinfo = FirebaseFirestore.instance.collection(email);

    await Firebase.initializeApp();
try{
  final user = await auth.createUserWithEmailAndPassword(email: email, password: password) ;
  userinfo
      .doc(email)
      .set({
    "Name":name,
      "email":email,
    "languagecode":languagecode,
    "countrycode":countrycode
  })
      .then((value) => print("User Added"))
      .catchError((error)  {
    print("Failed to add user: $error");
    Error = error;

  });
  // userinfo.add({
  //   "Name":name,
  //   "email":email,
  //   "password":password
  //
  // });

}
catch(e){
  Error = e;
  print(e);

}



  }

  Future<void> adduser()async{



  }
}