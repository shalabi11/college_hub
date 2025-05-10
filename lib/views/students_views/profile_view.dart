// import 'package:college_hub/widgets/Bottom_navigate_bar.dart';
// import 'package:college_hub/constant.dart';
import 'package:college_hub/core/styles.dart';
// import 'package:college_hub/functions.dart';
// import 'package:college_hub/model/theme.dart';
// import 'package:college_hub/views/login_page.dart';
// import 'package:college_hub/widgets/custom_bottun.dart';
import 'package:college_hub/widgets/informationForStudent.dart';
import 'package:college_hub/widgets/logOutButton.dart';
// import 'package:college_hub/widgets/textField.dart';
import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static String id = 'profile view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(),
      // bottomNavigationBar:,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(maxRadius: 75),
              Text('اسم الطالب', style: Styles.textStyle30),
              Text('[الرقم الجامعي]', style: Styles.textStyle16),
              InformationForStudent(name: 'التخصص'),
              InformationForStudent(name: 'المستوى'),
              InformationForStudent(
                name: 'البريد الإلكتروني: [email protected]',
              ),

              // CustomTextField(text: 'المستوى  '),
              // CustomTextField(text: ' البريد الإلكتروني: [email protected]'),
              SizedBox(height: 20), LogOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
