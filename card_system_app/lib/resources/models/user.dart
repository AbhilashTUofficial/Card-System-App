import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseUserProvider = Provider<UserDetails>((ref) => UserDetails());

class UserDetails {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> getUsername() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();
    return snap.get("username");
  }

  Future<String> getUserEmail() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();
    return snap.get("email");
  }
}

final databaseGeneralDataProvider =
    Provider<GeneralData>((ref) => GeneralData());

class GeneralData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<int> getEntryCount() async {
    final QuerySnapshot qSnap = await _firestore.collection("Cases").get();
    final int count = qSnap.docs.length;
    return count;
  }

  Future<List> getEntryCaseId() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    final QuerySnapshot result = await _firestore.collection('Cases').get();
    final List<DocumentSnapshot> documents = result.docs;
    List caseIds = [];
    documents.forEach((data) => caseIds.add(data['CaseId']));
    return caseIds;
  }

  Future<List> getUpdateData() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    final QuerySnapshot result = await _firestore.collection('Cases').get();
    final List<DocumentSnapshot> documents = result.docs;
    List caseIds = [];
    documents.forEach((data) => caseIds.add(data['CaseId']));

    List updates = [];
    caseIds.forEach((id) async {
      DocumentSnapshot snap =
          await _firestore.collection("Cases").doc(id).get();
      updates.add(
          [snap.get("Name"), snap.get("Department"), snap.get("Description"),snap.get("Card id")]);
    });

    return updates;
  }

  Future<String> getEntryName(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap =
    await _firestore.collection("Cases").doc(id).get();
    return snap.get("Name");
  }


  Future<String> getEntryDept(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap =
    await _firestore.collection("Cases").doc(id).get();
    return snap.get("Department");
  }

  Future<String> getEntryDesc(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap =
    await _firestore.collection("Cases").doc(id).get();
    return snap.get("Description");
  }

  Future<int> getEntryCard(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap =
    await _firestore.collection("Cases").doc(id).get();
    return snap.get("Card id");
  }

  Future<String> getEntryDate(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap =
    await _firestore.collection("Cases").doc(id).get();
    return snap.get("Date");
  }

  Future<String> getEntryTime(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap =
    await _firestore.collection("Cases").doc(id).get();
    return snap.get("Time");
  }

  Future<String> getEntryRegNo(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap =
    await _firestore.collection("Cases").doc(id).get();
    return snap.get("Register Number");
  }

}
