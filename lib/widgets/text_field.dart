import 'package:college_hub/constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.onChanged,
    this.obscure,
    this.icon,
    this.keyboardType,
    this.validator,

    this.controller,
    this.maxLine,
  });
  final String? text;
  final bool? obscure;
  final Icon? icon;
  final int? maxLine;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: TextFormField(
          // cursorWidth: BorderSide.strokeAlignInside,
          maxLines: maxLine,
          validator: validator,
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

            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: kPrimaryBlue,
                strokeAlign: 200,
              ),

              borderRadius: BorderRadius.circular(12),
              gapPadding: 12,
            ),

            hintStyle: const TextStyle(color: kPrimaryBlue),
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
