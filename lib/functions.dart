import 'package:hive_flutter/adapters.dart';

Future<void> saveLoginData(String email, String password) async {
  var box = await Hive.openBox('college');
  await box.put('email', email);
  await box.put('password', password);
}

Future<bool> isUserLoggedIn() async {
  var box = await Hive.openBox('college');
  String? email = box.get('email');
  String? password = box.get('password');
  return email != null && password != null;
}

Future<void> logOut() async {
  var box = await Hive.openBox('college');
  await box.delete('email');
  await box.delete('password');
}
