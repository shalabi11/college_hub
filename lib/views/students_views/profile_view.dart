import 'dart:developer';

import 'package:college_hub/core/styles.dart';
import 'package:college_hub/cubit/profile_cubit.dart';
import 'package:college_hub/cubit/profile_state.dart';
import 'package:college_hub/helper/show_snack_bar.dart';

import 'package:college_hub/widgets/information_for_student.dart';
import 'package:college_hub/widgets/log_out_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
    required this.name,
    required this.uid,
    required this.role,
  });
  static String id = 'profile view';
  final String name;
  final String uid;
  final String role;

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
            ProfileCubit().uploadProfileImage();
          }
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      imageWidget,

                      ElevatedButton(
                        onPressed: () {
                          cubit.pickImage();

                          cubit.uploadProfileImage();
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                  Text(name, style: Styles.textStyle30),
                  Text(uid, style: Styles.textStyle16),
                  InformationForStudent(name: role),
                  InformationForStudent(name: 'السنة الدراسية'),
                  InformationForStudent(name: "${cubit.user!.email}"),

                  SizedBox(height: 20),
                  LogOutButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
