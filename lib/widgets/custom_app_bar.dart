import 'package:college_hub/constant.dart';
import 'package:college_hub/core/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryBlue,
      elevation: 10,

      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Image.asset(logo, height: 60),

          Text(
            title,
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
      actions: actions,

      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
