import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'CRUD/general_methods.dart';
import 'CRUD/user_methods.dart';

// User Providers
//***************************************************************************//

// Provider for fetching username

final usernameProvider = FutureProvider<String>((ref) async {
  return ref.read(databaseUserProvider).getUsername();
});

// Provider for fetching user email

final userEmailProvider = FutureProvider<String>((ref) async {
  return ref.read(databaseUserProvider).getUserEmail();
});

// Entry Updates Providers

//***************************************************************************//
// Provider for fetching updates count

final entryCountProvider = FutureProvider<int>((ref) async {
  return ref.read(databaseGeneralDataProvider).getEntryCount();
});

// Provider for fetching caseId (update id)

final caseIdProvider = FutureProvider<List>((ref) async {
  return ref.read(databaseGeneralDataProvider).getEntryCaseId();
});

// Provider for fetching update data (name,date,time,card color,department,description,sub by and etc)
// All in single list

final updateProvider = FutureProvider.family<List,String>((ref,id) async {
  return ref.read(databaseGeneralDataProvider).getUpdateData(id);
});



// Provider for cards array (register number)

final cardsArrayProvider = FutureProvider.family<List, String>((ref, regNo) async {
  return ref.read(databaseGeneralDataProvider).getCards(regNo);
});

// History Providers
//***************************************************************************//

// Provider for fetching history count

final historyCountProvider = FutureProvider<List>((ref) async {
  return ref.read(databaseGeneralDataProvider).getHistory();
});

// Provider for fetching history data (name)

final historyNameProvider = FutureProvider.family<String,String>((ref,regNo) async {
  return ref.read(databaseGeneralDataProvider).getHistoryName(regNo);
});

// Provider for fetching history data (Department name)

final historyDeptProvider = FutureProvider.family<String,String>((ref,regNo) async {
  return ref.read(databaseGeneralDataProvider).getHistoryDept(regNo);
});

// Provider for fetching history data (Batch)

final historyBatchProvider = FutureProvider.family<String,String>((ref,regNo) async {
  return ref.read(databaseGeneralDataProvider).getHistoryBatch(regNo);
});

// Provider for fetching history data (red cards)

final historyRedCardsCountProvider = FutureProvider.family<List,String>((ref,regNo) async {
  return ref.read(databaseGeneralDataProvider).getRedCardCount(regNo);
});

// Provider for fetching history data (yellow cards)

final historyYellowCardsCountProvider = FutureProvider.family<List,String>((ref,regNo) async {
  return ref.read(databaseGeneralDataProvider).getYellowCardCount(regNo);
});

// Provider for fetching history data (blue cards)

final historyBlueCardsCountProvider = FutureProvider.family<List,String>((ref,regNo) async {
  return ref.read(databaseGeneralDataProvider).getBlueCardCount(regNo);
});

// Provider for fetching history data (green cards)

final historyGreenCardsCountProvider = FutureProvider.family<List,String>((ref,regNo) async {
  return ref.read(databaseGeneralDataProvider).getGreenCardCount(regNo);
});