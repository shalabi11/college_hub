import 'package:college_hub/constant.dart';
import 'package:college_hub/core/styles.dart';
import 'package:college_hub/functions.dart';

import 'package:flutter/material.dart';

class CardForDashboardStudents extends StatelessWidget {
  const CardForDashboardStudents({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          DataOfCardDashboard(),
          DataOfCardDashboard(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                getTitleForIndexStudent(1);
              },
              child: Text(
                'عرض الجدول بالكامل ',
                style: Styles.textStyle16.copyWith(color: kPrimaryBlue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DataOfCardDashboard extends StatelessWidget {
  const DataOfCardDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('data', style: Styles.textStyle16),
          Text(
            'الساعة 10 صباحا',
            style: Styles.textStyle16.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
