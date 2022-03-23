import 'package:card_system_app/resources/CRUD/cards_methods.dart';
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
    // required String date,
    // required String time,
  }) async {
    String res = "error occurred";
    try {
      if (name.isNotEmpty ||
          department.isNotEmpty ||
          cardId.isNaN ||
          description.isEmpty ||
          regNo.isEmpty) {
        DateTime now = DateTime.now();

        String date = now.year.toString() +
            "/" +
            now.month.toString() +
            "/" +
            now.day.toString();
        String time = now.hour.toString() + ":" + now.minute.toString();
        // String caseId = date.replaceAll("/", "") +
        //     time.replaceAll(":", "") +
        //     _auth.currentUser!.uid;

        String caseId = DateTime.now().microsecondsSinceEpoch.toString() +
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

              await _firestore.collection('Recent').doc(caseId).set({
                'CaseId': caseId,
                'TimeDate': DateTime.now().microsecondsSinceEpoch
              });

              final studentsSnapShot = await FirebaseFirestore.instance
                  .collection('Students')
                  .doc(regNo)
                  .get();

              if (studentsSnapShot == null || !studentsSnapShot.exists) {
                switch (cardId) {
                  case 0:
                    {

                      await _firestore
                          .collection("Students")
                          .doc(regNo)
                          .set({
                        'Name': name.trim(),
                        'Register': regNo,
                        'Department': department,
                        'Course': 'N/A',
                        'Batch': '20' + ib.toString() + ' - 20' + jb.toString(),
                        'Phone number': 'N/A',
                        'Address': 'N/A',
                        'Red Cards': FieldValue.arrayUnion([caseId]),
                      });
                    }
                    break;
                  case 1:
                    {

                      await _firestore
                          .collection("Students")
                          .doc(regNo)
                          .set({
                        'Name': name.trim(),
                        'Register': regNo,
                        'Department': department,
                        'Course': 'N/A',
                        'Batch': '20' + ib.toString() + ' - 20' + jb.toString(),
                        'Phone number': 'N/A',
                        'Address': 'N/A',
                        'Yellow Cards': FieldValue.arrayUnion([caseId])
                      });
                    }
                    break;
                  case 2:
                    {
                      await _firestore
                          .collection("Students")
                          .doc(regNo)
                          .set({
                        'Name': name.trim(),
                        'Register': regNo,
                        'Department': department,
                        'Course': 'N/A',
                        'Batch': '20' + ib.toString() + ' - 20' + jb.toString(),
                        'Phone number': 'N/A',
                        'Address': 'N/A',
                        'Blue Cards': FieldValue.arrayUnion([caseId])
                      });
                    }
                    break;
                  case 3:
                    {
                      await _firestore
                          .collection("Students")
                          .doc(regNo)
                          .set({
                        'Name': name.trim(),
                        'Register': regNo,
                        'Department': department,
                        'Course': 'N/A',
                        'Batch': '20' + ib.toString() + ' - 20' + jb.toString(),
                        'Phone number': 'N/A',
                        'Address': 'N/A',
                        'Green Cards': FieldValue.arrayUnion([caseId])
                      });
                    }
                }
              } else {
                switch (cardId) {
                  case 0:
                    {

                      await _firestore
                          .collection("Students")
                          .doc(regNo)
                          .update({
                        'Name': name.trim(),
                        'Register': regNo,
                        'Department': department,
                        'Course': 'N/A',
                        'Batch': '20' + ib.toString() + ' - 20' + jb.toString(),
                        'Phone number': 'N/A',
                        'Address': 'N/A',
                        'Red Cards': FieldValue.arrayUnion([caseId]),
                      });
                    }
                    break;
                  case 1:
                    {

                      await _firestore
                          .collection("Students")
                          .doc(regNo)
                          .update({
                        'Name': name.trim(),
                        'Register': regNo,
                        'Department': department,
                        'Course': 'N/A',
                        'Batch': '20' + ib.toString() + ' - 20' + jb.toString(),
                        'Phone number': 'N/A',
                        'Address': 'N/A',
                        'Yellow Cards': FieldValue.arrayUnion([caseId])
                      });
                    }
                    break;
                  case 2:
                    {
                      await _firestore
                          .collection("Students")
                          .doc(regNo)
                          .update({
                        'Name': name.trim(),
                        'Register': regNo,
                        'Department': department,
                        'Course': 'N/A',
                        'Batch': '20' + ib.toString() + ' - 20' + jb.toString(),
                        'Phone number': 'N/A',
                        'Address': 'N/A',
                        'Blue Cards': FieldValue.arrayUnion([caseId])
                      });
                    }
                    break;
                  case 3:
                    {
                      await _firestore
                          .collection("Students")
                          .doc(regNo)
                          .update({
                        'Name': name.trim(),
                        'Register': regNo,
                        'Department': department,
                        'Course': 'N/A',
                        'Batch': '20' + ib.toString() + ' - 20' + jb.toString(),
                        'Phone number': 'N/A',
                        'Address': 'N/A',
                        'Green Cards': FieldValue.arrayUnion([caseId])
                      });
                    }
                }
              }

              // Add entry to SearchIndex collection
              final searchIndexSnapShot = await FirebaseFirestore.instance
                  .collection('SearchIndex')
                  .doc("registerNumbers")
                  .get();

              if (searchIndexSnapShot == null || !searchIndexSnapShot.exists) {
                await _firestore
                    .collection("SearchIndex")
                    .doc("registerNumbers")
                    .set({
                  'RegisterNumber': FieldValue.arrayUnion([regNo])
                });
              }else{
                await _firestore
                    .collection("SearchIndex")
                    .doc("registerNumbers")
                    .update({
                  'RegisterNumber': FieldValue.arrayUnion([regNo])
                });
              }

              CardsMethods().yellowCardCalc(regNo);
              CardsMethods().blueCardCalc(regNo);

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
