import 'package:college_hub/constant.dart';

import 'package:college_hub/cubit/login_state.dart';
import 'package:college_hub/cubit/sign_up_cubit.dart';
import 'package:college_hub/helper/show_snack_bar.dart';
import 'package:college_hub/model/user_model.dart';

import 'package:college_hub/views/login_page.dart';

import 'package:college_hub/widgets/custom_bottun.dart';
import 'package:college_hub/widgets/text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static String id = 'signUp';

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
  final List<String> jobs = ['طالب', 'دكتور', 'موظف'];
  String? selectedJob;
  final formKey = GlobalKey<FormState>();
  UserModel? userModel;
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();

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

                isAsyncCAll = false;
                setState(() {});
              } else if (state is LoginFailure) {
                showSnackBar(context, 'state.message', Colors.red);
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(logo, height: 300),

                          // SizedBox(height: 20),
                          CustomTextField(
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return 'الرجاء ادخال الاسم الثلاثي ';
                              }
                              return null;
                            },
                            onChanged: (p0) {
                              name.text = p0;
                            },
                            controller: name,
                            keyboardType: TextInputType.name,
                            text: 'الاسم الثلاثي ',
                            icon: Icon(
                              Icons.person_2_outlined,
                              color: kTextLight,
                            ),
                          ),
                          CustomTextField(
                            maxLine: 1,
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
                            text: "البريد الالكتروني",
                            icon: Icon(
                              Icons.person_2_outlined,
                              color: kTextLight,
                            ),
                          ),

                          CustomTextField(
                            validator: (p0) {
                              if (p0 == null || p0.isEmpty) {
                                return 'الرجاء ادخال كلمة المرور ';
                              }
                              return null;
                            },
                            controller: password,
                            keyboardType: TextInputType.visiblePassword,
                            maxLine: 1,
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
                                  context,
                                );
                                var box = await Hive.openBox('college');

                                box.put('isLoggedIn', true);
                              }
                            },
                            color: kPrimaryBlue,
                            text: 'انشاء حساب ',
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
