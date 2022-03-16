import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'user_methods.dart';

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
        final String caseId = date.replaceAll("/", "") +
            time.replaceAll(":", "") +
            _auth.currentUser!.uid;
        if (name.trim() != "" && regNo.trim() != "") {
          try {
            // Verify Register number
            int ib = int.parse(regNo.substring(0, 2));
            int jb = int.parse(regNo.substring(2, 4));
            if (ib < jb) {
              // Add entry to Cases collection
              await _firestore.collection('Cases').doc(caseId).set({
                'Name': name.trim(),
                'Register Number': regNo.trim(),
                'Department': department,
                'Card id': cardId,
                'Date': date,
                'Time': time,
                'Description': description.trim(),
                'CaseId': caseId,
                'SubBy': await UserDetails().getUsername(),
              });

              // Add entry to Students collection
              await _firestore.collection('Students').doc(regNo).set({
                'Name': name.trim(),
                'Register': regNo,
                'Department': department,
                'Course': 'N/A',
                'Batch': '20' + ib.toString() + ' - 20' + jb.toString(),
                'Phone number': 'N/A',
                'Address': 'N/A',
              });

              switch (cardId) {
                case 0:
                  {
                    await _firestore.collection("Students").doc(regNo).update({
                      'Red Cards': FieldValue.arrayUnion([caseId])
                    });

                  }
              }


              // Add entry to SearchIndex collection
              await _firestore
                  .collection("SearchIndex")
                  .doc("registerNumbers")
                  .update({
                'RegisterNumber': FieldValue.arrayUnion([regNo])
              });
            }
            res = "Verify your Register number";
          } catch (e) {
            res = "Verify your Register number";
          }

          res = 'Your Submission Successful';
        } else {
          res = "Enter name and register number";
        }
      }
    } on FirebaseAuthException catch (err) {
      res = err.code.toString();
    }
    return res;
  }
}
