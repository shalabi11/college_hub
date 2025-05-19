import 'package:college_hub/constant.dart';
import 'package:college_hub/core/styles.dart';

import 'package:flutter/material.dart';

class CardForDashboardDoctors extends StatelessWidget {
  const CardForDashboardDoctors({super.key, required this.text});
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
          Center(child: DataOfCardDashboard()),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
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
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('نظم تشغيل 2 ', style: Styles.textStyle18),
              Text(
                'الساعة 10 صباحا',
                style: Styles.textStyle14.copyWith(color: Colors.grey),
              ),
            ],
          ),
          Text(
            'القاعة 10 ',
            style: Styles.textStyle16.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
