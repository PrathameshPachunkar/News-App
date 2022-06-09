import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


class readdata{

  late String email;
  readdata({ required this.email});

  Future<void> getdata()async{
    final app =  await FirebaseFirestore.instance;
    CollectionReference ref = FirebaseFirestore.instance.collection(email);
    final data = ref.doc(email).get();
    print(data.toString());

  }

}
class firebasedata{
  late String name ;
  late String password;

  firebasedata({required this.name, required this.password});
}