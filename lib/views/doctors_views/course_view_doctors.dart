import 'package:college_hub/core/styles.dart';
import 'package:college_hub/widgets/card_for_doctors_schedule.dart';

import 'package:flutter/material.dart';

class CourseViewDoctors extends StatelessWidget {
  const CourseViewDoctors({super.key});
  static String id = 'study schedule ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 15),
            Text(' مقرراتي الدراسية ', style: Styles.textStyle20),
            SizedBox(height: 15),

            CardForDoctorsSchedule(
              text: 'مقدمة في البرمجة ',
              time: '12:00',
              date: 'الاحد 12 ابريل',
              place: 'القاعة 4',
            ),
            CardForDoctorsSchedule(
              text: 'مقدمة في البرمجة ',
              time: '12:00',
              date: 'الاحد 12 ابريل',
              place: 'القاعة 4',
            ),

            CardForDoctorsSchedule(
              text: 'مقدمة في البرمجة ',
              time: '12:00',
              date: 'الاحد 12 ابريل',
              place: 'القاعة 4',
            ),
          ],
        ),
      ),
    );
  }
}
