import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String username,
    required String password,
  }) async {
    String res = "error occurred";
    try {
      if (email.isNotEmpty) {
        if (username.isNotEmpty) {
          if(password.isNotEmpty) {
            if (password.length < 8) {
              res = "password is too weak!";
            } else {
              // Register user
              UserCredential cred = await _auth.createUserWithEmailAndPassword(
                  email: email, password: password);
              // Add user to database
              await _firestore.collection('users').doc(cred.user!.uid).set({
                'username': username,
                'email': email,
                'uid': cred.user!.uid,
              });
              res = 'success';
            }
          }
          else{
            res="Enter your password";
          }
        } else {
          res = "Enter your username";
        }
      } else {
        res = "Enter your email address";
      }
    } on FirebaseAuthException catch (err) {
      String e = err.code.toString();
      switch (e) {
        case 'email-already-in-use':
          {
            res = "This Email is already in use";
          }
          break;
        case 'invalid-email':
          {
            res = "Email is not found";
          }
          break;
        case 'network-request-failed':{
          res="Check your internet connection";
          break;
        }
        default:
          {
            res = e;
          }
          break;
      }
    }
    return res;
  }

  // Login user
  Future<String> logInUser(
      {required String email, required String password}) async {
    String res = "an error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Enter email and password";
      }
    } on FirebaseAuthException catch (err) {
      String e = err.code.toString();
      switch (e) {
        case 'wrong-password':
          {
            res = "The Password you entered is wrong";
          }
          break;
        case 'user-not-found':
          {
            res = "User not found";
          }
          break;
        case 'invalid-email':
          {
            res = "Email is not found";
          }
          break;
        case 'network-request-failed':{
          res="Check your internet connection";
          break;
        }
        default:
          {
            res = e;
          }
          break;
      }
    }

    return res;
  }

  // SignOut user
  Future<void> signOut() async {
    _auth.signOut();
  }
}
