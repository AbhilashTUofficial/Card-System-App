import 'package:card_system_app/resources/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final usernameProvider=FutureProvider<String>((ref)async{
  return ref.read(databaseUserProvider).getUsername();
});

final userEmailProvider=FutureProvider<String>((ref)async{
  return ref.read(databaseUserProvider).getUserEmail();
});