import 'package:card_system_app/resources/models/crud_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Submit new entry
  Future<String> submitNewEntry({
    required String name,
    required String department,
    required int cardId,
    required String description,
    required String regNo,
    required String date,
    required String time,
  }) async {
    String res = "error occurred";
    try {
      if (name.isNotEmpty ||
          department.isNotEmpty ||
          cardId.isNaN ||
          description.isEmpty ||
          regNo.isEmpty ||
          date.isEmpty) {
        final String caseId = date.replaceAll("/", "")+time.replaceAll(":", "") + _auth.currentUser!.uid;
        if (name.trim() != "" || regNo.trim() != "") {
          // Add entry to database
          await _firestore.collection('Cases').doc(caseId).set({
            'Name': name.trim(),
            'Register Number': regNo.trim(),
            'Department': department,
            'Card id': cardId,
            'Date': date,
            'Time':time,
            'Description': description.trim(),
            'CaseId':caseId,
            'SubBy':await UserDetails().getUsername(),
          });
          res = 'success';
        }
      }
    } on FirebaseAuthException catch (err) {
      res = err.code.toString();
    }
    return res;
  }
}
