import 'package:college_hub/core/styles.dart';

import 'package:college_hub/widgets/custom_app_bar.dart';

import 'package:college_hub/widgets/elevated_button_for_confirm.dart';
import 'package:college_hub/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SendNotView extends StatefulWidget {
  const SendNotView({super.key});
  static String id = 'send notfication view';
  @override
  State<SendNotView> createState() => _SendNotViewState();
}

class _SendNotViewState extends State<SendNotView> {
  final List<String> jobs = ['جميع الطلاب', 'طالب محدد'];
  String? selectedJob;

  bool isRead = false;
  GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ارسال اشعار'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('الى :', style: Styles.textStyle20),
                SizedBox(height: 15),
                select(),
                SizedBox(height: 15),
                Text('الموضوع :', style: Styles.textStyle20),
                SizedBox(height: 15),
                CustomTextField(
                  text: 'عنوان الاشعار',
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'الرجاء ادخال عنوان الاشعار   ';
                    }
                    return null;
                  },
                ),

                Text('الرسالة  :', style: Styles.textStyle20),
                SizedBox(height: 15),
                CustomTextField(
                  text: 'اكتب رسالتك هنا .. ',
                  validator: (p) {
                    if (p == null || p.isEmpty) {
                      return 'الرجاء ادخال موضوع الرسالة  ';
                    }
                    return null;
                  },
                  maxLine: 5,
                ),

                ElevatedButtonForConfirmation(
                  onTap: () {
                    if (key.currentState!.validate()) {}
                  },
                  conf: 'ارسال',
                  content: 'هل انت متأكد من ارسال الاشعار',
                  title: 'تأكيد ارسال الاشعار',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownButtonFormField<String> select() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'اختر الوجهة',
        border: OutlineInputBorder(),
      ),
      value: selectedJob,
      items:
          jobs.map((job) {
            return DropdownMenuItem<String>(value: job, child: Text(job));
          }).toList(),
      onChanged: (value) {
        setState(() {
          selectedJob = value;
        });
      },
      validator: (value) => value == null ? 'الرجاء اختيار الوجهة' : null,
    );
  }
}
