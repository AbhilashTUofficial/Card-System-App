import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseUserProvider =Provider<UserDetails>((ref)=>UserDetails());

class UserDetails{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
    await _firestore.collection("users").doc(currentUser.uid).get();
    final userEmail = StateProvider((ref) => currentUser.email).toString();
    return currentUser.email.toString();
  }
}


