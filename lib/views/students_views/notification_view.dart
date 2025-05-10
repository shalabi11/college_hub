// import 'package:college_hub/widgets/Bottom_navigate_bar.dart';
import 'package:college_hub/core/styles.dart';
import 'package:college_hub/widgets/card_for_student_schedule.dart';
import 'package:college_hub/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});
  static String id = 'notification view';
  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'الاشعارات',
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                isRead = true;
              });
            },
            child: Text(
              'تمييز الكل كمقروء',
              style: Styles.textStyle14.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // SizedBox(height: 20),
            SizedBox(height: 15),
            // Center(child: Text('الاحد 12 ابريل', style: Styles.textStyle20)),
            CardForStudentSchedule(isRead: isRead),
            CardForStudentSchedule(isRead: isRead),
            CardForStudentSchedule(isRead: isRead),
            CardForStudentSchedule(isRead: isRead),
            CardForStudentSchedule(isRead: isRead),
            CardForStudentSchedule(isRead: isRead),
            CardForStudentSchedule(isRead: isRead),
          ],
        ),
      ),
    );
  }
}
