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

final updateProvider = FutureProvider<List>((ref) async {
  return ref.read(databaseGeneralDataProvider).getUpdateData();
});

// Provider for fetching update data (name)

final entryNameProvider =
    FutureProvider.family<String, String>((ref, id) async {
  return ref.read(databaseGeneralDataProvider).getEntryName(id);
});

// Provider for fetching update data (department name)

final entryDeptProvider =
    FutureProvider.family<String, String>((ref, id) async {
  return ref.read(databaseGeneralDataProvider).getEntryDept(id);
});

// Provider for fetching update data (description)

final entryDescProvider =
    FutureProvider.family<String, String>((ref, id) async {
  return ref.read(databaseGeneralDataProvider).getEntryDesc(id);
});

// Provider for fetching update data (card color)

final entryCardProvider = FutureProvider.family<int, String>((ref, id) async {
  return ref.read(databaseGeneralDataProvider).getEntryCard(id);
});

// Provider for fetching update data (date)

final entryDateProvider = FutureProvider.family<String, String>((ref, id) async {
  return ref.read(databaseGeneralDataProvider).getEntryDate(id);
});

// Provider for fetching update data (time)

final entryTimeProvider = FutureProvider.family<String, String>((ref, id) async {
  return ref.read(databaseGeneralDataProvider).getEntryTime(id);
});

// Provider for fetching update data (register number)

final entryRegNoProvider = FutureProvider.family<String, String>((ref, id) async {
  return ref.read(databaseGeneralDataProvider).getEntryRegNo(id);
});

// Provider for fetching update data (register number)

final entrySubByProvider = FutureProvider.family<String, String>((ref, id) async {
  return ref.read(databaseGeneralDataProvider).getEntrySubBy(id);
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