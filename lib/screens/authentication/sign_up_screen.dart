// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:suit_up/controllers/asset_manager.dart';
import 'package:suit_up/screens/authentication/sign_in_screen.dart';
import 'package:suit_up/widgets/custom_button.dart';
import 'package:suit_up/widgets/custom_text.dart';
import 'package:suit_up/widgets/custom_textfeild.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _passController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          HeightCustom(60),
          const Text(
            'Hello, Welcome!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.purple,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomText(
              text: "Get started with your account",
              textAlign: TextAlign.center,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade800,
            ),
          ),
          HeightCustom(10),
          CustomTextFeild(
            height: 80,
            controller: _nameController,
            heading: 'Full Name ',
            hintText: 'Suhail Thakrani',
          ),
          CustomTextFeild(
            heading: 'Email',
            height: 80,
            controller: _emailController,
            hintText: 'suhailthakrani12@gmail.com',
          ),
          CustomTextFeild(
            height: 80,
            controller: _phoneController,
            hintText: '+923483053712',
            heading: 'Phone',
          ),
          CustomTextFeild(
            height: 80,
            controller: _passController,
            suffix: const Icon(Icons.visibility),
            hintText: '*********',
            heading: 'Password',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: CustomText(
                  text: 'Forget Password?',
                  color: Colors.purple,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          CustomButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            height: 48,
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Text(
              'Sign In',
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * 0.2,
                height: 1,
                color: Colors.grey,
              ),
              const Text('  Or Continue with '),
              Container(
                width: width * 0.2,
                height: 1,
                color: Colors.grey,
              ),
            ],
          ),
          HeightCustom(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                height: 50,
                width: 60,
                onPressed: () {},
                child: Image.asset(
                  AssetManager.googleLogo,
                ),
              ),
              CustomButton(
                height: 50,
                width: 60,
                padding: EdgeInsets.all(12),
                onPressed: () {},
                child: Image.asset(
                  AssetManager.facebookLogo,
                ),
              ),
              CustomButton(
                height: 50,
                width: 60,
                onPressed: () {},
                child: Image.asset(
                  AssetManager.appleLogo,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const SignInScreen()));
                  },
                  child: RichText(
                      text: TextSpan(
                          text: 'Already Member?  ',
                          style: TextStyle(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.w500,
                          ),
                          children: const [
                        TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                fontSize: 16),
                            children: [TextSpan(text: '  ')])
                      ])))
            ],
          ),
        ],
      ),
    );
  }
}

class HeightCustom extends StatelessWidget {
  double? height;
  HeightCustom(
    this.height,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class WidthCustom extends StatelessWidget {
  double? width;
  WidthCustom(
    this.width,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
