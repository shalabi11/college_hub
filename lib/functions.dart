import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

String getTitleForIndexStudent(int index) {
  switch (index) {
    case 0:
      return 'الرئيسية';
    case 1:
      return 'جدول الدوام';
    case 2:
      return 'الدرجات';
    case 3:
      return 'القاعة الامتحانية';
    case 4:
      return 'الملف الشخصي';
    default:
      return '';
  }
}

String getTitleForIndexDoctors(int index) {
  switch (index) {
    case 0:
      return 'الرئيسية';
    case 1:
      return 'المقررات ';
    case 2:
      return 'الدرجات';
    case 3:
      return 'الملف الشخصي';
    default:
      return '';
  }
}

Future<void> saveLoginData(String email, String password) async {
  var box = await Hive.openBox('college');
  await box.put('email', email);
  await box.put('password', password);
  // await box.put('role', role);
}

Future<bool> isUserLoggedIn() async {
  var box = await Hive.openBox('college');
  String? email = box.get('email');
  String? password = box.get('password');
  String? role = box.get('role');
  return email != null && password != null && role != null;
}

Future<void> logOut() async {
  var box = await Hive.openBox('college');
  await box.delete('email');
  await box.delete('password');
  await box.delete('role');
}

Future<void> notification(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("🔴 رسالة بالخلفية: ${message.notification?.title}");
}

void requestPremession() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('المستخدم وافق');
  } else {
    print('المستخدم رفض الاذن');
  }
}

void sendMessage() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("📥 رسالة أثناء الاستخدام");
    print("Title: ${message.notification?.title}");
    print("Body: ${message.notification?.body}");
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('المستخدم فتح الرسالة ');
  });
}

void getDeviceToken() async {
  String? token = await FirebaseMessaging.instance.getToken();
  print("📱 FCM Token: $token");
}
