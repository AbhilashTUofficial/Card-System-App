import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Database CRUD methods
final databaseGeneralDataProvider =
    Provider<GeneralData>((ref) => GeneralData());

class GeneralData {
  // FirebaseFirestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get entry count from database
  Future<int> getEntryCount() async {
    final QuerySnapshot qSnap = await _firestore.collection("Cases").get();
    final int count = qSnap.docs.length;
    return count;
  }

  // get entry id from database (case id)
  Future<List> getEntryCaseId() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    final QuerySnapshot result = await _firestore.collection('Cases').get();
    final List<DocumentSnapshot> documents = result.docs;
    List caseIds = [];
    documents.forEach((data) => caseIds.add(data['CaseId']));
    caseIds.sort();
    caseIds = List.from(caseIds.reversed);
    return caseIds;
  }

  // get entry data from the database
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
      updates.add([
        snap.get("Name"),
        snap.get("Department"),
        snap.get("Description"),
        snap.get("Card id")
      ]);
    });

    return updates;
  }

  // get entry name from database
  Future<String> getEntryName(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap = await _firestore.collection("Cases").doc(id).get();
    return snap.get("Name");
  }

  // get entry department from database
  Future<String> getEntryDept(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap = await _firestore.collection("Cases").doc(id).get();
    return snap.get("Department");
  }

  // get entry description from database
  Future<String> getEntryDesc(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap = await _firestore.collection("Cases").doc(id).get();
    return snap.get("Description");
  }

  // get entry card id from database
  Future<int> getEntryCard(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap = await _firestore.collection("Cases").doc(id).get();
    return snap.get("Card id");
  }

  // get entry date from database
  Future<String> getEntryDate(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap = await _firestore.collection("Cases").doc(id).get();
    return snap.get("Date");
  }

  // get entry time from database
  Future<String> getEntryTime(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap = await _firestore.collection("Cases").doc(id).get();
    return snap.get("Time");
  }

  // get entry register number from database
  Future<String> getEntryRegNo(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap = await _firestore.collection("Cases").doc(id).get();
    return snap.get("Register Number");
  }

  // get entry "submitted by"  from database
  Future<String> getEntrySubBy(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap = await _firestore.collection("Cases").doc(id).get();
    return snap.get("SubBy");
  }

  // get entry cards  from Students collection
  Future<List> getCards(String regNo) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap =
        await _firestore.collection("Students").doc(regNo).get();
    return [
      snap.get('redCards'),
      snap.get('yellowCards'),
      snap.get('blueCards'),
      snap.get('greenCards'),
    ];
  }

  // get history count from database
  Future<List> getHistory() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot snap = await _firestore.collection("SearchIndex").doc("registerNumbers").get();
    final List history = snap.get("RegisterNumber");
    return history;
  }

  // get history name form database
  Future<String> getHistoryName(regNo) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot snap = await _firestore.collection("Students").doc(regNo).get();
    final String name = snap.get("Name");
    return name;
  }

  // get history department form database
  Future<String> getHistoryDept(regNo) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot snap = await _firestore.collection("Students").doc(regNo).get();
    final String dept = snap.get("Department");
    return dept;
  }

  // get history batch form database
  Future<String> getHistoryBatch(regNo) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot snap = await _firestore.collection("Students").doc(regNo).get();
    final String dept = snap.get("Batch");
    return dept;
  }


}
