import 'dart:async';

import 'package:college_hub/constant.dart';
import 'package:college_hub/views/doctors_views/doctors_home_view.dart';
import 'package:college_hub/views/employees_views/employee_home_view.dart';
import 'package:college_hub/views/login_page.dart';
import 'package:college_hub/views/students_views/student_home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String id = 'Splash view';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 4), () async {
        var box = await Hive.openBox('college');
        var isLoggedIn = box.get('isLoggedIn', defaultValue: false);
        var role = box.get('role');

        if (isLoggedIn && role != null) {
          Widget targetPage;

          if (role == 'طالب') {
            targetPage = StudentHomePage();
          } else if (role == 'دكتور') {
            targetPage = DoctorsHomeView();
          } else if (role == 'موظف') {
            targetPage = EmployeeHomeView();
          } else {
            targetPage = LoginPage();
          }

          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder:
                  (context, animation, secondaryAnimation) => targetPage,
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(seconds: 2),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder:
                  (context, animation, secondaryAnimation) => LoginPage(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(seconds: 2),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(logo), width: 300),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
