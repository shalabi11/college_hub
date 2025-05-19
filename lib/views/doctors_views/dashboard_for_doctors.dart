import 'package:college_hub/core/styles.dart';
import 'package:college_hub/widgets/card_for_dashboard_doctors.dart';

import 'package:flutter/material.dart';

class DashboardForDoctors extends StatelessWidget {
  const DashboardForDoctors({super.key});
  static String id = 'Dashboard for doctors view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20),

            Text('مرحبا د.[اسم الاستاذ 😊]', style: Styles.textStyle20),

            SizedBox(height: 10),

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
