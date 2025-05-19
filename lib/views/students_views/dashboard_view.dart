import 'package:college_hub/core/styles.dart';
import 'package:college_hub/widgets/card_for_dashboard_students.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static String id = 'Dashboard view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20),

            Text('مرحبا د.[اسم الطالب 😊]', style: Styles.textStyle20),

            SizedBox(height: 10),
            CardForDashboardStudents(text: 'جدول محاضراتي اليوم'),
            CardForDashboardStudents(text: 'جدول محاضراتي اليوم'),
            CardForDashboardStudents(text: 'جدول محاضراتي اليوم'),
            CardForDashboardStudents(text: 'جدول محاضراتي اليوم'),
            CardForDashboardStudents(text: 'جدول محاضراتي اليوم'),
          ],
        ),
      ),
    );
  }
}
