import 'package:college_hub/core/styles.dart';
import 'package:flutter/material.dart';

class GradesView extends StatelessWidget {
  const GradesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('سيتم عرض الدرجات هنا ', style: Styles.textStyle20),
      ),
    );
  }
}
