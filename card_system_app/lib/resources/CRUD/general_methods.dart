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
    final QuerySnapshot qSnap = await _firestore.collection("Recent").get();
    final int count = qSnap.docs.length;
    return count;
  }

  // get entry id from database (case id)
  Future<List> getEntryCaseId() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    final QuerySnapshot result = await _firestore.collection('Recent').get();
    final List<DocumentSnapshot> documents = result.docs;
    List caseIds = [];
    documents.forEach((data) => caseIds.add(data['CaseId']));

    // for(var i=0;i>=0;i++){
    //   DocumentSnapshot data=caseIds[i];
    //   DateTime upDate=data["TimeDate"];
    //   DateTime cDate=upDate.add(const Duration(microseconds:86400000 ));
    //
    //   if(DateTime.now().compareTo(cDate).isNegative){
    //     print("hi");
    //   }
    // }

    caseIds.sort();
    caseIds = List.from(caseIds.reversed);
    return caseIds;
  }

  // get entry data from the database
  Future<List> getUpdateData(String id) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    DocumentSnapshot snap = await _firestore.collection("Cases").doc(id).get();
    return [
      snap.get("Name"),
      snap.get("Department"),
      snap.get("Card id"),
      snap.get("Register Number"),
      snap.get("Description"),
      snap.get("Batch"),
      snap.get("SubBy"),
      snap.get("Time"),
      snap.get("Date"),
    ];
  }

  // get history count from database
  Future<List> getHistory() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot snap =
        await _firestore.collection("SearchIndex").doc("registerNumbers").get();
    final List history = snap.get("RegisterNumber");
    return history;
  }

  // get history data from the database
  Future<List> getHistoryData(String regNo) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot snap =
        await _firestore.collection("Students").doc(regNo).get();
    return [
      snap.get("Name"),
      snap.get("Department"),
      snap.get("Register"),
      snap.get("Batch"),
      snap.get("Red Cards"),
      snap.get("Yellow Cards"),
      snap.get("Blue Cards"),
      snap.get("Green Cards"),
    ];
  }

}
