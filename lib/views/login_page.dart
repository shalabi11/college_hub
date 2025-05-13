// import 'dart:developer';

import 'package:college_hub/constant.dart';
import 'package:college_hub/cubit/login_cubit.dart';
import 'package:college_hub/cubit/login_state.dart';
import 'package:college_hub/helper/show_snack_bar.dart';
import 'package:college_hub/views/sign_up_page.dart';
// import 'package:college_hub/views/students_views/dashboard_view.dart';
import 'package:college_hub/views/students_views/student_home_page.dart';
import 'package:college_hub/widgets/custom_bottun.dart';
import 'package:college_hub/widgets/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = 'loginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();
  final TextEditingController role = TextEditingController();

  bool isLoadin = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: ModalProgressHUD(
        blur: 20,
        inAsyncCall: isLoadin,
        child: Scaffold(
          body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSucces) {
                isLoadin = false;
                setState(() {});
                showSnackBar(context, ' تم تسجيل الدخول بنجاح', Colors.green);
                Navigator.pushReplacementNamed(context, StudentHomePage.id);
              } else if (state is LoginFailure) {
                isLoadin = false;
                setState(() {});
                showSnackBar(context, state.message, Colors.red);
                print('email : ${email.text}');
                print(password.text);
              } else if (state is LoginLoading) {
                isLoadin = true;
                setState(() {});
              }
            },
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(Icons.school, size: 150, color: kPrimaryBlue),
                        // Text(
                        //   "CollegeHub",
                        //   style: TextStyle(
                        //     fontSize: 30,
                        //     fontWeight: FontWeight.bold,
                        //     color: kPrimaryBlue,
                        //   ),
                        Image.asset(logo, height: 300),

                        // SizedBox(height: 20),
                        CustomTextField(
                          onChanged: (p0) {
                            email.text = p0;
                          },
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          text: "الرقم الجامعي أو البريد الالكتروني",
                          icon: Icon(
                            Icons.person_2_outlined,
                            color: kTextLight,
                          ),
                        ),
                        // SizedBox(height: 20),
                        CustomTextField(
                          onChanged: (p0) {
                            password.text = p0;
                          },
                          controller: password,
                          keyboardType: TextInputType.visiblePassword,
                          text: "كلمة المرور ",
                          obscure: true,
                          icon: Icon(Icons.lock_outlined, color: kTextLight),
                        ),
                        CustomTextField(
                          onChanged: (p0) {
                            role.text = p0;
                          },
                          controller: role,
                          // keyboardType: TextInputType.visiblePassword,
                          text: "المهنة  ",
                          obscure: true,
                          icon: Icon(Icons.emoji_people, color: kTextLight),
                        ),

                        // SizedBox(height: 20),
                        CustomBottun(
                          onTap: () async {
                            await BlocProvider.of<LoginCubit>(
                              context,
                            ).login(email.text, password.text, role.text);
                            var box = await Hive.openBox('college');
                            box.put('isLoggedIn', true);
                          },
                          color: kPrimaryBlue,
                          text: 'تسجيل الدخول ',
                          page: StudentHomePage.id,
                        ),
                        SizedBox(height: 20),

                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'هل نسيت كلمة المرور ؟',
                            style: TextStyle(color: kPrimaryBlue),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              SignUpPage.id,
                            );
                          },
                          child: Text(
                            ' انشاء حساب ',
                            style: TextStyle(color: kPrimaryBlue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

//   Future<void> loginUser() async {
//     UserCredential userCredential = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email.text, password: password.text);
//   }
// }
