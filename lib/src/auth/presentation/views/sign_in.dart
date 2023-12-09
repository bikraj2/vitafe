import 'package:flutter/material.dart';
import 'package:fun_chat/core/constants/colors.dart';
import 'package:fun_chat/core/extensions/context_extensions.dart';
import 'package:fun_chat/core/widgets/Gaps.dart';
import 'package:fun_chat/core/widgets/custom_button.dart';
import 'package:fun_chat/core/widgets/custom_logo_button.dart';
import 'package:fun_chat/src/auth/presentation/widgets/inputs.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController usernameController;
  late TextEditingController emailController;

  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();

  bool isVisible = false;
  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();

    passwordController = TextEditingController();

    emailController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
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
              'Sign In to  ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
            Stack(
              children: [
                Positioned(
                  bottom: 2,
                  child: Container(
                    width: 100,
                    height: 7,
                    color: KColors.primaryColor,
                  ),
                ),
                const Text(
                  'FunChat',
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
                'Welcome back! Sign in using your socials or using your email/username',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const VerticalGap(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoButton(
                    borderColor: Colors.white,
                    imagePath: 'facebook.png',
                    onPressed: () {},
                    radius: 20,
                  ),
                  LogoButton(
                    borderColor: Colors.white,
                    imagePath: 'google.png',
                    onPressed: () {},
                    radius: 20,
                  ),
                  LogoButton(
                    borderColor: Colors.white,
                    imagePath: 'apple.png',
                    onPressed: () {},
                    radius: 20,
                  ),
                ],
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
                        'Or Sign in in Using',
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
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      IField(
                        suffixIcon: const Icon(Icons.email_outlined),
                        controller: emailController,
                        filled: true,
                        fillcolour: Colors.grey.withOpacity(0.04),
                        hintText: 'Email or username',
                        validator: (val) {
                          if (val == '' || val!.length < 8) {
                            return 'Enter a Valid email or password';
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
                          if (val == '') {
                            return 'Enter a Valid password';
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        pressed: KColors.primaryColor,
                        inactive: Colors.white,
                        background: KColors.primaryColor,
                        buttomText: 'Sign In',
                      ),
                    ),
                    const VerticalGap(height: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 18,
                          color: KColors.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
