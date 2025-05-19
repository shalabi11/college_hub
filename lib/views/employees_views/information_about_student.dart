import 'package:college_hub/core/styles.dart';
import 'package:college_hub/widgets/card_for_emp.dart';
import 'package:college_hub/widgets/text_field.dart';
import 'package:flutter/material.dart';

class InformationAboutStudent extends StatelessWidget {
  const InformationAboutStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('إدارة الطلاب', style: Styles.textStyle20),
                ),

                Expanded(
                  child: CustomTextField(text: 'البحث بالاسم ', maxLine: 1),
                ),
              ],
            ),
            CardForEmpWidget(),
            CardForEmpWidget(),
            CardForEmpWidget(),
          ],
        ),
      ),
    );
  }
}
