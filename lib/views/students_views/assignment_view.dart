import 'package:college_hub/core/styles.dart';
import 'package:flutter/material.dart';

class AssignmentView extends StatelessWidget {
  const AssignmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('سيتم عرض توزيع القاعات هنا ', style: Styles.textStyle20),
      ),
    );
  }
}
