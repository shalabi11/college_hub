import 'package:college_hub/constant.dart';

import 'package:flutter/material.dart';

class CustomBottun extends StatelessWidget {
  const CustomBottun({
    super.key,
    required this.color,
    required this.text,
    this.page,
    required this.onTap,
  });
  final Color color;
  final String text;
  final String? page;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: kPrimaryBlue),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
