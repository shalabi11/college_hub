// student_home_page.dart

import 'package:college_hub/views/students_views/assignment_view.dart';
import 'package:college_hub/views/students_views/grades_view.dart';
import 'package:college_hub/widgets/Icon_theme.dart';
import 'package:college_hub/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:college_hub/views/students_views/dashboard_view.dart';
import 'package:college_hub/views/students_views/study_schedule_view.dart';
// import 'package:college_hub/views/students_views/ads_view.dart';
import 'package:college_hub/views/students_views/notification_view.dart';
import 'package:college_hub/views/students_views/profile_view.dart';
import 'package:college_hub/constant.dart';

class StudentHomePage extends StatefulWidget {
  static String id = 'student_home'; // استخدمه بالتنقل
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _views = [
    DashboardView(),
    StudyScheduleView(),
    // AdsView(),
    // NotificationView(),
    GradesView(),
    AssignmentView(),
    ProfileView(),
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
        title: getTitleForIndex(_selectedIndex),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NotificationView.id);
            },
            icon: Icon(Icons.notifications),
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
            label: 'الجدول',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school), // ← الدرجات بدل الإعلانات
            label: 'الدرجات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task), // ← الواجبات بدل الإشعارات
            label: 'الواجبات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الملف الشخصي',
          ),
        ],
      ),
    );
  }
}

String getTitleForIndex(int index) {
  switch (index) {
    case 0:
      return 'الرئيسية';
    case 1:
      return 'جدول الدوام';
    case 2:
      return 'الدرجات';
    case 3:
      return 'الواجبات';
    case 4:
      return 'الملف الشخصي';
    default:
      return '';
  }
}
