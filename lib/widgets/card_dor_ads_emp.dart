import 'package:college_hub/core/styles.dart';
import 'package:flutter/material.dart';

class CardForAdsEmp extends StatelessWidget {
  const CardForAdsEmp({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('تأجيل امتحان الأسبوع القادم', style: Styles.textStyle20),
            Text(
              'نشر في: 10 أبريل 2025 - الجمهور: جميع الطلاب',
              style: Styles.textStyle14,
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('تعديل')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: Text('حذف')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
