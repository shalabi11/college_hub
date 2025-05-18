// import 'dart:developer';

// import 'package:college_hub/cubit/login_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_hub/cubit/login_state.dart';
import 'package:college_hub/functions.dart';
import 'package:college_hub/views/doctors_views/doctors_home_view.dart';
import 'package:college_hub/views/students_views/student_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:hive/hive.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  login(
    String email,
    String password,
    String expectedRole,
    BuildContext context,
  ) async {
    emit(LoginLoading());
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user!.uid;
      final userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (userDoc.exists) {
        final userData = userDoc.data();
        final actualRole = userData?['role'];

        if (actualRole == expectedRole) {
          saveLoginData(email, password);
          var box = await Hive.openBox('college');
          box.clear();
          box.put('role', actualRole);
          box.put('isLoggedIn', true);

          if (actualRole == 'طالب') {
            Navigator.pushReplacementNamed(context, StudentHomePage.id);
          } else if (actualRole == 'دكتور') {
            Navigator.pushReplacementNamed(context, DoctorsHomeView.id);
          }
        } else {
          await FirebaseAuth.instance.signOut();
          emit(
            LoginFailure(
              message: 'الدور غير متطابق. هذا الحساب ليس من نوع $expectedRole',
            ),
          );
        }
      } else {
        await FirebaseAuth.instance.signOut();
        emit(
          LoginFailure(
            message: 'تعذر العثور على بيانات المستخدم في Firestore.',
          ),
        );
      }
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
