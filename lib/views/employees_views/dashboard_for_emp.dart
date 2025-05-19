import 'package:college_hub/core/styles.dart';
import 'package:college_hub/widgets/card_for_dashboard_emp.dart';

import 'package:college_hub/widgets/grid_view_for_emp.dart';
import 'package:flutter/material.dart';

class DashboardForEmp extends StatelessWidget {
  const DashboardForEmp({super.key});
  static String id = 'Dashboard for doctors view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20),

            Text('مرحبا د.[اسم الموظف 😊]', style: Styles.textStyle20),

            SizedBox(height: 10),

            GridViewForEmp(),
            SizedBox(height: 20),

            Text('اجراءات سريعة', style: Styles.textStyle20),
            GestureDetector(onTap: () {}, child: GridViewForEmp()),
            SizedBox(height: 20),
            CardForDashboardEmp(),
          ],
        ),
      ),
    );
  }
}
