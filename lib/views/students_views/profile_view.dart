// import 'package:college_hub/widgets/Bottom_navigate_bar.dart';
// import 'package:college_hub/constant.dart';
import 'dart:developer';

import 'package:college_hub/core/styles.dart';
import 'package:college_hub/cubit/profile_cubit.dart';
import 'package:college_hub/cubit/profile_state.dart';
import 'package:college_hub/helper/show_snack_bar.dart';
// import 'package:college_hub/functions.dart';
// import 'package:college_hub/model/theme.dart';
// import 'package:college_hub/views/login_page.dart';
// import 'package:college_hub/widgets/custom_bottun.dart';
import 'package:college_hub/widgets/informationForStudent.dart';
import 'package:college_hub/widgets/logOutButton.dart';
// import 'package:college_hub/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/adapters.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static String id = 'profile view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),

      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            showSnackBar(context, state.message, Colors.red);
          }
        },
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          Widget imageWidget;
          if (state is ProfileUploaded) {
            log('succes');

            imageWidget = CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(state.imageUrl),
            );
          } else if (state is ProfileImagePicked) {
            imageWidget = CircleAvatar(
              radius: 100,
              backgroundImage: FileImage(state.imageFile),
            );
          } else {
            imageWidget = CircleAvatar(
              radius: 100,
              child: Icon(Icons.person, size: 100, color: Colors.grey),
            );
          }
          return Scaffold(
            // appBar: CustomAppBar(),
            // bottomNavigationBar:,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      imageWidget,

                      ElevatedButton(
                        onPressed: () => cubit.pickImage(),
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                  Text('اسم الطالب', style: Styles.textStyle30),
                  Text('[الرقم الجامعي]', style: Styles.textStyle16),
                  InformationForStudent(name: 'التخصص'),
                  InformationForStudent(name: 'السنة الدراسية'),
                  InformationForStudent(name: "${cubit.user!.email}"),

                  // CustomTextField(text: 'المستوى  '),
                  // CustomTextField(text: ' البريد الإلكتروني: [email protected]'),
                  SizedBox(height: 20), LogOutButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
