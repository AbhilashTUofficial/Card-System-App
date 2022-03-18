import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CardsMethods {
  // Yellow Cards fusion
  Future<void> yellowCardCalc(regNo) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot snap =
        await _firestore.collection("Students").doc(regNo).get();
    List cards = snap.get("Yellow Cards");
    String name = snap.get("Name");
    String department = snap.get("Department");
    if (cards.length == 4) {
      String caseId = DateTime.now().microsecondsSinceEpoch.toString() + "auto";
      DateTime now = DateTime.now();
      String date = now.year.toString() +
          "/" +
          now.month.toString() +
          "/" +
          now.day.toString();
      String time = now.hour.toString() + ":" + now.minute.toString();

      await _firestore.collection("Students").doc(regNo).update({
        'Yellow Cards': [],
        'Red Cards': FieldValue.arrayUnion([caseId]),
      });
      await _firestore
          .collection('Recent')
          .doc(caseId)
          .set({'CaseId': caseId, 'TimeDate': now.microsecondsSinceEpoch});
      await _firestore.collection('Cases').doc(caseId).set({
        'Name': name.trim(),
        'Register Number': regNo.trim(),
        'Department': department,
        'Card id': 0,
        'Date': date,
        'Time': time,
        'Description': "Yellow Card Fusion",
        'CaseId': caseId,
        'SubBy': "auto",
      });
    }
  }

  // Blue Cards fusion
  Future<void> blueCardCalc(regNo) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot snap =
        await _firestore.collection("Students").doc(regNo).get();
    List cards = snap.get("Blue Cards");
    String name = snap.get("Name");
    String department = snap.get("Department");
    if (cards.length == 4) {
      String caseId = DateTime.now().microsecondsSinceEpoch.toString() + "auto";
      DateTime now = DateTime.now();
      String date = now.year.toString() +
          "/" +
          now.month.toString() +
          "/" +
          now.day.toString();
      String time = now.hour.toString() + ":" + now.minute.toString();

      await _firestore.collection("Students").doc(regNo).update({
        'Blue Cards': [],
        'Green Cards': FieldValue.arrayUnion([caseId]),
      });
      await _firestore
          .collection('Recent')
          .doc(caseId)
          .set({'CaseId': caseId, 'TimeDate': now.microsecondsSinceEpoch});
      await _firestore.collection('Cases').doc(caseId).set({
        'Name': name.trim(),
        'Register Number': regNo.trim(),
        'Department': department,
        'Card id': 3,
        'Date': date,
        'Time': time,
        'Description': "Blue Card Fusion",
        'CaseId': caseId,
        'SubBy': "auto",
      });
    }
  }
}
