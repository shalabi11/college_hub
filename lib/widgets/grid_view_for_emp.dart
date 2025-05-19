import 'package:college_hub/widgets/card_for_emp.dart';
import 'package:flutter/material.dart';

class GridViewForEmp extends StatelessWidget {
  const GridViewForEmp({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      reverse: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return CardForEmpWidget();
      },
    );
  }
}
