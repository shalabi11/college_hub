// import 'dart:developer';

import 'package:college_hub/constant.dart';
import 'package:college_hub/cubit/login_cubit.dart';
import 'package:college_hub/cubit/login_state.dart';
import 'package:college_hub/helper/show_snack_bar.dart';
import 'package:college_hub/views/sign_up_page.dart';

import 'package:college_hub/views/students_views/student_home_page.dart';
import 'package:college_hub/widgets/custom_bottun.dart';
import 'package:college_hub/widgets/text_field.dart';

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
  final List<String> jobs = ['طالب', 'دكتور', 'موظف'];
  String? selectedJob;

  final TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final TextEditingController password = TextEditingController();

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
            listener: (context, state) async {
              if (state is LoginSucces) {
                showSnackBar(context, 'تم تسجيل الدخول بنجاح', Colors.green);

                isLoadin = false;
                setState(() {});
              } else if (state is LoginFailure) {
                isLoadin = false;
                setState(() {});

                showSnackBar(context, state.message, Colors.red);
              } else if (state is LoginLoading) {
                isLoadin = true;
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(logo, height: 300),

                          CustomTextField(
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return 'الرجاء ادخال البريد الالكتروني  ';
                              }
                              return null;
                            },
                            onChanged: (p0) {
                              email.text = p0;
                            },
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            text: "البريد الالكتروني",
                            icon: Icon(
                              Icons.person_2_outlined,
                              color: kTextLight,
                            ),
                          ),

                          CustomTextField(
                            maxLine: 1,
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return 'الرجاء ادخال كلمة المرور ';
                              }
                              return null;
                            },
                            onChanged: (p0) {
                              password.text = p0;
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
                                await BlocProvider.of<LoginCubit>(
                                  context,
                                ).login(
                                  email.text,
                                  password.text,
                                  selectedJob!,
                                  context,
                                );

                                var box = await Hive.openBox('college');

                                box.put('isLoggedIn', true);
                              }
                              isLoadin = false;
                              setState(() {});
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
