// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:suit_up/controllers/asset_manager.dart';
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
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello, Welcome!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomText(
                text: "Create your account",
                textAlign: TextAlign.center,
                fontSize: 24,
                // fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            CustomTextFeild(
              height: 50,
              controller: _emailController,
              hintText: 'Enter Full Name',
            ),
            const SizedBox(height: 10),
            CustomTextFeild(
              height: 50,
              controller: _emailController,
              hintText: 'Enter email',
            ),
            const SizedBox(height: 10),
            CustomTextFeild(
              height: 50,
              controller: _emailController,
              hintText: 'Enter Phone Number',
            ),
            const SizedBox(height: 10),
            CustomTextFeild(
              height: 50,
              controller: _passController,
              suffix: const Icon(Icons.visibility),
              hintText: 'Enter password',
            ),
            const SizedBox(height: 16),
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [CustomText(text: 'Already member? Sign In')],
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
                const Text('  Or  '),
                Container(
                  width: width * 0.2,
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 16),
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
                  onPressed: () {},
                  child: Image.asset(
                    AssetManager.facebookLogo,
                    height: 40,
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
            )
          ],
        ),
      ),
    );
  }
}
