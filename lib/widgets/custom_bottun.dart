// import 'dart:ui';

import 'package:college_hub/constant.dart';
// import 'package:college_hub/views/students_views/dashboard_view.dart';
// import 'package:college_hub/views/students_views/student_home_page.dart';
import 'package:flutter/material.dart';

class CustomBottun extends StatelessWidget {
  const CustomBottun({
    super.key,
    required this.color,
    required this.text,
    required this.page,
    required this.onTap,
  });
  final Color color;
  final String text;
  final String page;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: kPrimaryBlue),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
