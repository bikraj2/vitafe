import 'package:flutter/material.dart';
import 'package:fun_chat/core/constants/colors.dart';
import 'package:fun_chat/core/extensions/context_extensions.dart';
import 'package:fun_chat/core/widgets/Gaps.dart';
import 'package:fun_chat/core/widgets/custom_button.dart';
import 'package:fun_chat/core/widgets/custom_logo_button.dart';
import 'package:fun_chat/src/auth/presentation/widgets/inputs.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController middleNameController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();

  bool isVisible = false;
  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    firstNameController = TextEditingController();
    passwordController = TextEditingController();
    lastNameController = TextEditingController();
    middleNameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    middleNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            const HorizontalGap(width: 30),
            const Text(
              'Sign Up With ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
            Stack(
              children: [
                Positioned(
                  bottom: 5,
                  child: Container(
                    width: 63,
                    height: 7,
                    color: KColors.primaryColor,
                  ),
                ),
                const Text(
                  'Email',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const VerticalGap(height: 20),
              const Text(
                'Find people with similar interest and make friends for life '
                'all online.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const VerticalGap(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      IField(
                        suffixIcon: const Icon(Icons.email_outlined),
                        controller: emailController,
                        filled: true,
                        fillcolour: Colors.grey.withOpacity(0.04),
                        hintText: 'Email',
                        validator: (val) {
                          if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                          ).hasMatch(val ?? '')) {
                            return 'Invalid Email';
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: (context.width - 80) / 2,
                            child: IField(
                              controller: firstNameController,
                              filled: true,
                              fillcolour: Colors.grey.withOpacity(0.04),
                              hintText: 'First Name',
                              validator: (val) {
                                if (val == '') {
                                  return 'Must contain at least one lette';
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: (context.width - 80) / 2,
                            child: IField(
                              controller: lastNameController,
                              filled: true,
                              fillcolour: Colors.grey.withOpacity(0.04),
                              hintText: 'Last Name',
                              validator: (val) {
                                if (val == '') {
                                  return 'This field is required';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      IField(
                        controller: usernameController,
                        filled: true,
                        fillcolour: Colors.grey.withOpacity(0.04),
                        hintText: 'Username',
                        validator: (val) {
                          if (val == '' || val!.length < 8) {
                            return 'Username must contain at least 8 character';
                          } else if (RegExp('.*[^a-zA-Z0-9_].*')
                              .hasMatch(val)) {
                            return 'Cannot contain any special Character';
                          }
                        },
                      ),
                      IField(
                        controller: passwordController,
                        filled: true,
                        fillcolour: Colors.grey.withOpacity(0.04),
                        obscureText: !isVisible,
                        hintText: 'Password',
                        validator: (val) {
                          if (val == '' || val!.length < 8) {
                            return 'Enter a Valid password';
                          } else if (!RegExp(r'.*\d.*').hasMatch(val)) {
                            return 'Must Contain at least one number';
                          } else if (!RegExp(
                            '.*[!@#\$%^&*()_+{}\\[\\]:;<>,.?~\\/\-].*',
                          ).hasMatch(val)) {
                            return 'Must Contain at least one special Character';
                          }
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                            Future.delayed(const Duration(milliseconds: 3000),
                                () {
                              setState(() {
                                isVisible = false;
                              });
                            });
                          },
                          child: Icon(
                            !isVisible
                                ? Icons.visibility
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPressed: () {
                    debugPrint('asdf');
                    if (formKey.currentState!.validate()) {
                      debugPrint('asdf');
                    }
                  },
                  pressed: KColors.primaryColor,
                  inactive: Colors.white,
                  background: KColors.primaryColor,
                  buttomText: 'Sign Up',
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      color: Colors.white,
                      child: const Text(
                        'Or Sign Up Using',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalGap(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoButton(
                    borderColor: Colors.black,
                    imagePath: 'facebook.png',
                    onPressed: () {},
                    radius: 20,
                  ),
                  LogoButton(
                    borderColor: Colors.black,
                    imagePath: 'google.png',
                    onPressed: () {},
                    radius: 20,
                  ),
                  LogoButton(
                    borderColor: Colors.black,
                    imagePath: 'apple.png',
                    onPressed: () {},
                    radius: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
