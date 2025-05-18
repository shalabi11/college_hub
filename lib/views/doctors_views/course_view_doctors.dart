// import 'package:college_hub/constant.dart';
import 'package:college_hub/core/styles.dart';
import 'package:college_hub/widgets/card_for_doctors_schedule.dart';
// import 'package:college_hub/widgets/Bottom_navigate_bar.dart';
// import 'package:college_hub/widgets/card_for_dashboard_students.dart';
import 'package:college_hub/widgets/card_for_student_schedule.dart';
import 'package:flutter/material.dart';

class CourseViewDoctors extends StatelessWidget {
  const CourseViewDoctors({super.key});
  static String id = 'study schedule ';
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
      //     child: Text("الجدول الدرسي", style: TextStyle(fontSize: 25)),
      //   ),
      // ),
      // // bottomNavigationBar:,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // SizedBox(height: 20),
            SizedBox(height: 15),
            Text(' مقرراتي الدراسية ', style: Styles.textStyle20),
            SizedBox(height: 15),

            // Center(child: Text('الاحد 12 ابريل', style: Styles.textStyle20)),
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
