// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:suit_up/controllers/asset_manager.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';
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
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello Again!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.purple,
              ),
            ),
            HeightCustom(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: CustomText(
                text: "Welcome Back you've been missed",
                textAlign: TextAlign.center,
                fontSize: 20,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextFeild(
                    heading: 'Email',
                    height: 80,
                    controller: _emailController,
                    hintText: 'suhailthakrani12@gmail.com',
                  ),
                  CustomTextFeild(
                    heading: 'Password',
                    height: 80,
                    controller: _passController,
                    suffix: const Icon(Icons.visibility),
                    hintText: '* * * * * * * *',
                  ),
                ],
              ),
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
                ),
                WidthCustom(10)
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
              width: MediaQuery.of(context).size.width * 0.9,
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
                              const SignUpScreen()));
                    },
                    child: RichText(
                        text: TextSpan(
                            text: 'New Here?  ',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w500,
                            ),
                            children: const [
                          TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  fontSize: 16),
                              children: [TextSpan(text: '     ')])
                        ])))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
