import 'package:flutter/material.dart';

class ElevatedButtonForConfirmation extends StatelessWidget {
  const ElevatedButtonForConfirmation({
    super.key,
    required this.title,
    required this.content,
    required this.conf,
    this.onTap,
  });
  final String title, content, conf;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                TextButton(
                  child: Text("إلغاء"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(onPressed: onTap, child: Text(conf)),
              ],
            );
          },
        );
      },
      child: Text(" ارسال"),
    );
  }
}
