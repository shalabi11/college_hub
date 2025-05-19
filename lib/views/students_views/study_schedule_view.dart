import 'package:college_hub/core/styles.dart';

import 'package:college_hub/widgets/card_for_student_schedule.dart';
import 'package:flutter/material.dart';

class StudyScheduleView extends StatelessWidget {
  const StudyScheduleView({super.key});
  static String id = 'study schedule ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 15),
            Center(child: Text('الاحد 12 ابريل', style: Styles.textStyle20)),
            CardForStudentSchedule(),
            CardForStudentSchedule(),
            CardForStudentSchedule(),
            CardForStudentSchedule(),
            CardForStudentSchedule(),
            CardForStudentSchedule(),
            CardForStudentSchedule(),
          ],
        ),
      ),
    );
  }
}
