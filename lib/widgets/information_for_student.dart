import 'package:college_hub/core/styles.dart';
import 'package:flutter/material.dart';

class InformationForStudent extends StatelessWidget {
  const InformationForStudent({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Text(
        name,
        style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w200),
      ),
    );
  }
}
