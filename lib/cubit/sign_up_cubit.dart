// import 'dart:developer';

import 'package:college_hub/cubit/login_state.dart';
import 'package:college_hub/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:hive/hive.dart';

class SignUpCubit extends Cubit<LoginState> {
  SignUpCubit() : super(LoginInitial());
  final FirebaseAuth auth = FirebaseAuth.instance;

  signup(String email, String password) async {
    // print(email);
    // print(password);
    emit(LoginLoading());
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      saveLoginData(email, password);
      var box = await Hive.openBox('userBox');
      box.put('isLoggedIn', true);

      emit(LoginSucces());

      // emit(LoginFailure(message: 'خطأ في اسم المتسخدم او كلمة المرور  '));
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(message: e.message ?? 'خطأ في انشاء الحساب'));
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
