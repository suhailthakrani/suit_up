// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:suit_up/controllers/asset_manager.dart';
import 'package:suit_up/widgets/custom_button.dart';
import 'package:suit_up/widgets/custom_text.dart';
import 'package:suit_up/widgets/custom_textfeild.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
              'Hello Again!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomText(
                  text: "Welcome Back you've been missed",
                  textAlign: TextAlign.center,
                  fontSize: 24,
                  // fontWeight: FontWeight.w600,
                  wordSpacing: 0.3,
                  letterSpacing: 0.3),
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
