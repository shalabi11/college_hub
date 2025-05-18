// import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_hub/cubit/login_state.dart';
import 'package:college_hub/functions.dart';
import 'package:college_hub/views/doctors_views/doctors_home_view.dart';
import 'package:college_hub/views/students_views/student_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:hive/hive.dart';

class SignUpCubit extends Cubit<LoginState> {
  SignUpCubit() : super(LoginInitial());
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  signup(
    String email,
    String password,
    String role,
    BuildContext context,
  ) async {
    // print(email);
    // print(password);
    emit(LoginLoading());
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = userCredential.user!.uid;

      await firestore.collection('users').doc(uid).set({
        'email': email,
        'role': role,
        // 'name': name,
      });
      saveLoginData(email, password);
      var box = await Hive.openBox('college');
      box.clear();
      box.put('role', role);
      box.put('isLoggedIn', true);

      emit(LoginSucces());
      if (role == 'طالب') {
        Navigator.pushReplacementNamed(context, StudentHomePage.id);
      } else if (role == 'دكتور') {
        Navigator.pushReplacementNamed(context, DoctorsHomeView.id);
      }

      // emit(LoginFailure(message: 'خطأ في اسم المتسخدم او كلمة المرور  '));
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(message: e.message ?? 'خطأ في انشاء الحساب'));
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
