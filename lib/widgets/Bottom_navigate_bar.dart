// // import 'package:college_hub/constant.dart';
// // import 'package:college_hub/views/students_views/ads_view.dart';
// // import 'package:college_hub/views/students_views/dashboard_view.dart';
// // import 'package:college_hub/views/students_views/notification_view.dart';
// // import 'package:college_hub/views/students_views/profile_view.dart';
// // // import 'package:college_hub/views/login_page.dart';
// // import 'package:college_hub/views/students_views/study_schedule_view.dart';
// // import 'package:flutter/material.dart';

// // class BottomNavigateBar extends StatelessWidget {
// //   const BottomNavigateBar({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return BottomNavigationBar(
// //       // currentIndex: 5,
// //       // iconSize: 5,
// //       enableFeedback: true,
// //       type: BottomNavigationBarType.fixed,
// //       selectedItemColor: kPrimaryBlue,
// //       showSelectedLabels: true,
// //       unselectedItemColor: kTextColor,
// //       onTap: (value) {},

// //       items: <BottomNavigationBarItem>[
// //         BottomNavigationBarItem(
// //           icon: GestureDetector(
// //             onTap: () {
// //               Navigator.pushReplacementNamed(context, DashboardView.id);
// //             },
// //             child: Icon(Icons.home_outlined),
// //           ),
// //           // activeIcon: Icon(Icons.home), // أيقونة مختلفة عند التفعيل
// //           label: 'الرئيسية',
// //         ),
// //         BottomNavigationBarItem(
// //           icon: GestureDetector(
// //             onTap: () {
// //               Navigator.pushReplacementNamed(context, StudyScheduleView.id);
// //             },
// //             child: Icon(Icons.calendar_today_outlined),
// //           ),
// //           activeIcon: Icon(Icons.calendar_today),
// //           label: 'الجدول',
// //         ),
// //         BottomNavigationBarItem(
// //           icon: GestureDetector(
// //             onTap: () {
// //               Navigator.pushReplacementNamed(context, AdsView.id);
// //             },
// //             child: Icon(Icons.campaign_outlined),
// //           ),
// //           activeIcon: Icon(Icons.campaign),
// //           label: 'الإعلانات',
// //         ),
// //         BottomNavigationBarItem(
// //           icon: GestureDetector(
// //             onTap: () {
// //               Navigator.pushReplacementNamed(context, NotificationView.id);
// //             },
// //             child: Icon(Icons.notifications_outlined),
// //           ),
// //           activeIcon: Icon(Icons.notifications),
// //           label: 'الإشعارات',
// //         ),
// //         BottomNavigationBarItem(
// //           icon: GestureDetector(
// //             onTap: () {
// //               Navigator.pushReplacementNamed(context, ProfileView.id);
// //             },
// //             child: Icon(Icons.person_outline),
// //           ),
// //           activeIcon: Icon(Icons.person),
// //           label: 'الملف الشخصي',
// //         ),
// //       ],
// //     );
// //   }
// // }

// // student_home_page.dart

// import 'package:flutter/material.dart';
// import 'package:college_hub/views/students_views/dashboard_view.dart';
// import 'package:college_hub/views/students_views/study_schedule_view.dart';
// import 'package:college_hub/views/students_views/ads_view.dart';
// import 'package:college_hub/views/students_views/notification_view.dart';
// import 'package:college_hub/views/students_views/profile_view.dart';
// import 'package:college_hub/constant.dart';

// class StudentHomePage extends StatefulWidget {
//   static const String id = 'student_home'; // استخدمه بالتنقل
//   const StudentHomePage({super.key});

//   @override
//   State<StudentHomePage> createState() => _StudentHomePageState();
// }

// class _StudentHomePageState extends State<StudentHomePage> {
//   int _selectedIndex = 0;

//   final List<Widget> _views = [
//     DashboardView(),
//     StudyScheduleView(),
//     AdsView(),
//     NotificationView(),
//     ProfileView(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _views[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: kPrimaryBlue,
//         unselectedItemColor: kTextColor,
//         showSelectedLabels: true,
//         enableFeedback: true,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: 'الرئيسية',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today),
//             label: 'الجدول',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.grade), // ← الدرجات بدل الإعلانات
//             label: 'الدرجات',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.task), // ← الواجبات بدل الإشعارات
//             label: 'الواجبات',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'الملف الشخصي',
//           ),
//         ],
//       ),
//     );
//   }
// }
