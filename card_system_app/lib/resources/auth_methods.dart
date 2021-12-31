import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthMethods{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;


  Future <String> signUpUser({
    required String email,
    required String username,
    required String password,
    // required Uint8List file,

}) async{
    String res="error occurred";
    try{
      if(email.isNotEmpty||username.isNotEmpty||password.isNotEmpty){
        // Register user
        UserCredential cred=await _auth.createUserWithEmailAndPassword(email: email, password: password);
        // Add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username':username,
          'email':email,
          'uid':cred.user!.uid,
        });

        // await _firestore.collection('users').add({
        //   'username':username,
        //   'email':email,
        //   'bio':bio,
        //   'followers':[],
        //   'following':[],
        //   'uid':cred.user!.uid,
        // });
      }
    }catch(err){
      res=err.toString();
    }
  return res;
  }
}