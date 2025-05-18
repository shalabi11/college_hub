// student_home_page.dart

import 'package:college_hub/functions.dart';
import 'package:college_hub/views/doctors_views/course_view_doctors.dart';
import 'package:college_hub/views/doctors_views/dashboard_for_doctors.dart';
import 'package:college_hub/views/doctors_views/send_not_view.dart';
// import 'package:college_hub/views/students_views/assignment_view.dart';
import 'package:college_hub/views/students_views/grades_view.dart';
import 'package:college_hub/widgets/Icon_theme.dart';
import 'package:college_hub/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
// import 'package:college_hub/views/students_views/dashboard_view.dart';
// import 'package:college_hub/views/students_views/study_schedule_view.dart';
// // import 'package:college_hub/views/students_views/ads_view.dart';
// import 'package:college_hub/views/students_views/notification_view.dart';
import 'package:college_hub/views/students_views/profile_view.dart';
import 'package:college_hub/constant.dart';

class DoctorsHomeView extends StatefulWidget {
  static String id = 'doctors_home'; // استخدمه بالتنقل
  const DoctorsHomeView({super.key});

  @override
  State<DoctorsHomeView> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorsHomeView> {
  int _selectedIndex = 0;

  final List<Widget> _views = [
    DashboardForDoctors(),
    CourseViewDoctors(),
    GradesView(),
    ProfileView(name: 'اسم الدكتور', role: 'دكتور', uid: 'id'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getTitleForIndexDoctors(_selectedIndex),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SendNotView.id);
            },
            icon: Icon(Icons.edit_notifications_outlined),
          ),
          IconThemeApp(),
        ],
      ),
      body: _views[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryBlue,
        unselectedItemColor: kTextColor,
        showSelectedLabels: true,
        enableFeedback: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'المقررات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school), // ← الدرجات بدل الإعلانات
            label: 'الدرجات',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.task), // ← الواجبات بدل الإشعارات
          //   label: 'القاعة الامتحانية',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ' الملف الشخصي',
          ),
        ],
      ),
    );
  }
}
