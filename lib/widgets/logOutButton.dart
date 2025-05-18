import 'package:college_hub/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("تأكيد تسجيل الخروج"),
              content: Text("هل أنت متأكد أنك تريد تسجيل الخروج؟"),
              actions: [
                TextButton(
                  child: Text("إلغاء"),
                  onPressed: () {
                    Navigator.of(context).pop(); // إغلاق الديالوج
                  },
                ),
                ElevatedButton(
                  child: Text("تسجيل الخروج"),
                  onPressed: () async {
                    var box = await Hive.openBox('college');
                    box.clear();
                    Navigator.of(context).pop(); // إغلاق الديالوج
                    Navigator.pushReplacementNamed(context, LoginPage.id);
                  },
                ),
              ],
            );
          },
        );
      },
      child: Text("تسجيل الخروج"),
    );
  }
}
