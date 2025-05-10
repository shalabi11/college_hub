import 'package:college_hub/constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.text,
    this.onChanged,
    this.obscure,
    this.icon,
    this.keyboardType,

    this.controller,
  });
  String? text;
  bool? obscure;
  Icon? icon;
  TextEditingController? controller;
  TextInputType? keyboardType;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: TextFormField(
          onChanged: onChanged,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscure ?? false,
          decoration: InputDecoration(
            prefixIcon: icon,
            labelText: text,
            floatingLabelStyle: const TextStyle(
              color: kPrimaryBlue,
              fontWeight: FontWeight.w100,
            ),
            // labelStyle: const TextStyle(
            //   color: kPrimaryBlue,
            //   fontWeight: FontWeight.w100,
            // ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryBlue),
              borderRadius: BorderRadius.circular(12),
              gapPadding: 12,
            ),
            // hintText: text,
            hintStyle: const TextStyle(color: kPrimaryBlue),
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
