import 'package:college_hub/core/styles.dart';
import 'package:flutter/material.dart';

class CardForEmpWidget extends StatelessWidget {
  const CardForEmpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Theme.of(context).cardColor,
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              '[1250]',
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'طالب مسجل',
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
