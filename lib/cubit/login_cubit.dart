// import 'dart:developer';

// import 'package:college_hub/cubit/login_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_hub/cubit/login_state.dart';
import 'package:college_hub/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:hive/hive.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  login(String email, String password, String role) async {
    // print(email);
    // print(password);
    emit(LoginLoading());
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = userCredential.user!.uid;

      await firestore.collection('users').doc(uid).set({
        'email': email,
        'role': role,
      });
      saveLoginData(email, password, role);
      var box = await Hive.openBox('userBox');
      box.put('isLoggedIn', true);

      emit(LoginSucces());

      // emit(LoginFailure(message: 'خطأ في اسم المتسخدم او كلمة المرور  '));
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(message: e.message ?? 'خطأ في تسجيل الدخول'));
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
