// student_home_page.dart

import 'package:college_hub/functions.dart';

import 'package:college_hub/views/doctors_views/send_not_view.dart';
import 'package:college_hub/views/employees_views/ads_view.dart';
import 'package:college_hub/views/employees_views/dashboard_for_emp.dart';
import 'package:college_hub/views/employees_views/information_about_doctors.dart';
import 'package:college_hub/views/employees_views/information_about_student.dart';

import 'package:college_hub/widgets/Icon_theme.dart';
import 'package:college_hub/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:college_hub/views/students_views/profile_view.dart';
import 'package:college_hub/constant.dart';

class EmployeeHomeView extends StatefulWidget {
  static String id = 'employee_home'; // استخدمه بالتنقل
  const EmployeeHomeView({super.key});

  @override
  State<EmployeeHomeView> createState() => _EmployeeHomeView();
}

class _EmployeeHomeView extends State<EmployeeHomeView> {
  int _selectedIndex = 0;

  final List<Widget> _views = [
    // DashboardForDoctors(),
    DashboardForEmp(),
    AdsView(),
    InformationAboutStudent(),
    InformationAboutDoctors(),
    ProfileView(name: 'اسم الموظف', role: 'موظف', uid: 'id'),
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
        title: getTitleForIndexEmp(_selectedIndex),
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
            label: 'الاعلانات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school), // ← الدرجات بدل الإعلانات
            label: 'الطلاب',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task), // ← الواجبات بدل الإشعارات
            label: 'الاساتذة ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ' الملف الشخصي',
          ),
        ],
      ),
    );
  }
}
