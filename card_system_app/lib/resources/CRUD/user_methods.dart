import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// User Auth methods
final databaseUserProvider = Provider<UserDetails>((ref) => UserDetails());

class UserDetails {

  // FirebaseAuth instance & FirebaseFirestore instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get username from the database
  Future<String> getUsername() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();
    return snap.get("username");
  }

  //get user email from the database
  Future<String> getUserEmail() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();
    return snap.get("email");
  }
}
