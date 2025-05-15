// import 'dart:developer';

import 'package:college_hub/constant.dart';
import 'package:college_hub/cubit/login_cubit.dart';
import 'package:college_hub/cubit/login_state.dart';
import 'package:college_hub/cubit/sign_up_cubit.dart';
import 'package:college_hub/helper/show_snack_bar.dart';
import 'package:college_hub/views/login_page.dart';
// import 'package:college_hub/views/students_views/dashboard_view.dart';
import 'package:college_hub/views/students_views/student_home_page.dart';
import 'package:college_hub/widgets/custom_bottun.dart';
import 'package:college_hub/widgets/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});
  static String id = 'signUp';

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
  final List<String> jobs = ['طالب', 'دكتور', 'موظف'];
  String? selectedJob;
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();
  final TextEditingController role = TextEditingController();
  bool isAsyncCAll = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: ModalProgressHUD(
        inAsyncCall: isAsyncCAll,
        blur: 10,
        child: Scaffold(
          body: BlocConsumer<SignUpCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSucces) {
                showSnackBar(context, ' تم انشاء حساب بنجاح', Colors.green);
                Navigator.pushReplacementNamed(context, StudentHomePage.id);
                isAsyncCAll = false;
                setState(() {});
              } else if (state is LoginFailure) {
                showSnackBar(context, state.message, Colors.red);
                print('email : ${email.text}');
                print(password.text);
                isAsyncCAll = false;
                setState(() {});
              } else if (state is LoginLoading) {
                isAsyncCAll = true;
                setState(() {});
              }
            },
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Center(
                  child: Form(
                    key: formKey,
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
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return 'الرجاء ادخال البريد الالكتروني ';
                              }
                              return null;
                            },
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
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return 'الرجاء ادخال كلمة المرور ';
                              }
                              return null;
                            },
                            controller: password,
                            keyboardType: TextInputType.visiblePassword,
                            text: "كلمة المرور ",
                            obscure: true,
                            icon: Icon(Icons.lock_outlined, color: kTextLight),
                          ),
                          selectJob(),

                          SizedBox(height: 20),
                          CustomBottun(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                await BlocProvider.of<SignUpCubit>(
                                  context,
                                ).signup(
                                  email.text,
                                  password.text,
                                  selectedJob!,
                                );
                                var box = await Hive.openBox('college');
                                box.put('isLoggedIn', true);
                                // Navigator.pushReplacementNamed(
                                //   context,
                                //   StudentHomePage.id,
                                // );
                              }
                            },
                            color: kPrimaryBlue,
                            text: 'انشاء حساب ',
                            page: StudentHomePage.id,
                          ),
                          SizedBox(height: 20),

                          GestureDetector(
                            onTap: () async {
                              Navigator.pushReplacementNamed(
                                context,
                                LoginPage.id,
                              );
                            },
                            child: Text(
                              'تسجيل دخول ',
                              style: TextStyle(color: kPrimaryBlue),
                            ),
                          ),
                        ],
                      ),
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

  DropdownButtonFormField<String> selectJob() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'اختر المهنة',
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
      validator: (value) => value == null ? 'الرجاء اختيار المهنة' : null,
    );
  }
}

//   Future<void> signUp() async {
//     UserCredential userCredential = await FirebaseAuth.instance
//         .createUserWithEmailAndPassword(
//           email: email.text,
//           password: password.text,
//         );
//   }
// }
