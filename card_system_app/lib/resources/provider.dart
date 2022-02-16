import 'package:card_system_app/resources/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

// Provider for fetching username

final usernameProvider=FutureProvider<String>((ref)async{
  return ref.read(databaseUserProvider).getUsername();
});

// Provider for fetching user email

final userEmailProvider=FutureProvider<String>((ref)async{
  return ref.read(databaseUserProvider).getUserEmail();
});

// Provider for fetching updates count

final entryCountProvider=FutureProvider<int>((ref)async{
  return ref.read(databaseGeneralDataProvider).getEntryCount();
});

// Provider for fetching caseId (update id)

final caseIdProvider=FutureProvider<List>((ref)async{
  return ref.read(databaseGeneralDataProvider).getEntryCaseId();
});

// Provider for fetching update data (name,date,time,card color,department,description,sub by and etc)

final updateProvider=FutureProvider<List>((ref)async{
  return ref.read(databaseGeneralDataProvider).getUpdateData();
});
