import 'package:flutter/material.dart';
import 'package:fun_chat/core/constants/colors.dart';
import 'package:fun_chat/core/extensions/context_extensions.dart';
import 'package:fun_chat/core/widgets/Gaps.dart';
import 'package:fun_chat/core/widgets/custom_button.dart';
import 'package:fun_chat/core/widgets/custom_logo_button.dart';
import 'package:go_router/go_router.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final Path path = Path();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: KColors.bgOnBoarding),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logos/app_logo.png',
                    width: 50,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Vitafe',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: const TextSpan(
                  text: 'Connect\n',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: 'friends\n',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    TextSpan(
                      text: 'easily &\nquickly',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalGap(height: 10),
              const Text(
                'Stay connected with your friends and\nfamily or find new '
                'people with\nsimilar interest living around you.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              const VerticalGap(height: 50),
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
                    imagePath: 'apple_white.png',
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
                      color: KColors.bgOnBoarding,
                      child: const Text(
                        'OR',
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
              CustomButton(
                pressed: KColors.primaryColor,
                inactive: KColors.primaryColor,
                background: Colors.white,
                buttomText: 'Sign Up Using mail',
                onPressed: () {
                  context.go('signUp');
                },
              ),
              const VerticalGap(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Existing account?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const HorizontalGap(width: 10),
                  GestureDetector(
                    onTap: () {
                      context.push('/signIn');
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
