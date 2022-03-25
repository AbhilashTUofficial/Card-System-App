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

final updateProvider = FutureProvider.family<List, String>((ref, id) async {
  return ref.read(databaseGeneralDataProvider).getUpdateData(id);
});

// History Providers
//***************************************************************************//

// Provider for fetching history count

final historyCountProvider = FutureProvider<List>((ref) async {
  return ref.read(databaseGeneralDataProvider).getHistory();
});

// Provider for fetching history data (name,cards,department, and etc)
// All in single list

final historyProvider = FutureProvider.family<List, String>((ref, regNo) async {
  return ref.read(databaseGeneralDataProvider).getHistoryData(regNo);
});
