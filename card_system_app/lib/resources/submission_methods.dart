import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SubMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Submit new entry
  Future<String> submitNewEntry({
    required String name,
    required String department,
    required String cardId,
    required String description,
    required String regNo,
    required String dateTime,
  }) async {
    String res = "error occurred";
    try {
      if (name.isNotEmpty ||
          department.isNotEmpty ||
          cardId.isNotEmpty ||
          description.isEmpty ||
          regNo.isEmpty ||
          dateTime.isEmpty) {
        final String caseId = dateTime + _auth.currentUser!.uid;
        print(name);
        if (name != "" || regNo != "") {
          // Add entry to database
          await _firestore.collection('Cases').doc(caseId).set({
            'Name': name,
            'Register Number': regNo,
            'Department': department,
            'Card id': cardId,
            'Date,Time': dateTime,
            'Description': description,
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
