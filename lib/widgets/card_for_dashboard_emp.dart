import 'package:college_hub/core/styles.dart';
import 'package:flutter/material.dart';

class CardForDashboardEmp extends StatelessWidget {
  const CardForDashboardEmp({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('آخر الإعلانات المنشورة ', style: Styles.textStyle18),
            Column(
              children: [
                Text('تأجيل امتحان الأسبوع القادم', style: Styles.textStyle16),

                Text(
                  'نشر: أمس - الجمهور: جميع الطلاب',
                  style: Styles.textStyle14,
                ),
              ],
            ),
            Divider(endIndent: 10, indent: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ورشة عمل حول الذكاء الاصطناعي',
                  style: Styles.textStyle16,
                ),
                Text(
                  'نشر: قبل يومين - الجمهور: طلاب علوم الحاسب',
                  style: Styles.textStyle14,
                ),
              ],
            ),
            TextButton(child: Text('ادارة كل الاعلانات'), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
