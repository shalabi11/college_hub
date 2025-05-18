// import 'package:college_hub/constant.dart';
// import 'package:college_hub/core/styles.dart';
// import 'package:college_hub/views/login_page.dart';
// import 'package:college_hub/widgets/Bottom_navigate_bar.dart';
// import 'package:college_hub/functions.dart';
// import 'package:college_hub/views/students_views/student_home_page.dart';
import 'package:college_hub/core/styles.dart';
import 'package:college_hub/widgets/card_for_dashboard_doctors.dart';
import 'package:college_hub/widgets/card_for_dashboard_students.dart';
import 'package:flutter/material.dart';

class DashboardForDoctors extends StatelessWidget {
  const DashboardForDoctors({super.key});
  static String id = 'Dashboard for doctors view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Icon(Icons.notifications_on_rounded),
      //     ),
      //   ],
      //   elevation: 2.5,
      //   title: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Text("لوحة التحكم ", style: TextStyle(fontSize: 25)),
      //   ),
      // ),
      // // bottomNavigationBar:,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20),

            Text('مرحبا د.[اسم الاستاذ 😊]', style: Styles.textStyle20),
            // SizedBox(height: 20),
            SizedBox(height: 10),
            // CardForDashboardStudents(),
            CardForDashboardDoctors(text: 'جدول محاضراتي اليوم'),
            CardForDashboardDoctors(text: 'جدول محاضراتي اليوم'),
            CardForDashboardDoctors(text: 'جدول محاضراتي اليوم'),
            CardForDashboardDoctors(text: 'جدول محاضراتي اليوم'),
          ],
        ),
      ),
    );
  }
}
