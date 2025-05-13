import 'package:college_hub/firebase_options.dart';
import 'package:college_hub/functions.dart';
import 'package:college_hub/model/theme.dart';
import 'package:college_hub/model/user_model.dart';
import 'package:college_hub/views/login_page.dart';
import 'package:college_hub/views/sign_up_page.dart';
import 'package:college_hub/views/splash_view.dart';
// import 'package:college_hub/views/students_views/dashboard_view.dart';
import 'package:college_hub/views/students_views/notification_view.dart';
// import 'package:college_hub/views/students_views/ads_view.dart';
// import 'package:college_hub/views/students_views/dashboard_view.dart';
// import 'package:college_hub/views/students_views/notification_view.dart';
// import 'package:college_hub/views/students_views/profile_view.dart';
import 'package:college_hub/views/students_views/student_home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:college_hub/views/students_views/study_schedule_view.dart';
// import 'package:college_hub/views/students_views/study_schedule_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(notification);

  await Hive.openBox('college');
  // await Hive.openBox('settingsBox');
  bool isDarkMode = Hive.box('college').get('isDarkMode', defaultValue: false);
  themeNotifier.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;

  runApp(CollegeHub());
}

class CollegeHub extends StatefulWidget {
  const CollegeHub({super.key});

  @override
  State<CollegeHub> createState() => _CollegeHubState();
}

class _CollegeHubState extends State<CollegeHub> {
  @override
  void initState() {
    super.initState();
    requestPremession();
    sendMessage();
    getDeviceToken();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder:
          (context, value, _) => MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: value,
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              );
            },
            debugShowCheckedModeBanner: false,
            // home: SplashView(),
            routes: {
              LoginPage.id: (context) => LoginPage(),
              StudentHomePage.id: (context) => StudentHomePage(),
              SplashView.id: (context) => SplashView(),
              SignUpPage.id: (context) => SignUpPage(),
              // DashboardView.id: (context) => DashboardView(),
              // StudyScheduleView.id: (context) => StudyScheduleView(),
              // AdsView.id: (context) => AdsView(),
              NotificationView.id: (context) => NotificationView(),
              // ProfileView.id: (context) => ProfileView(),
            },
            initialRoute: SplashView.id,
          ),
    );
  }
}
// class SplashViewBody extends StatelessWidget {
//   const SplashViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  SplashView();
//   }
// }
