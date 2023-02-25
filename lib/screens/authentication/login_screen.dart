// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'package:suit_up/constants/colors.dart';
import 'package:suit_up/controllers/asset_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            SizedBox(height: height * 0.05),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Welcome Back you've been missed",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    // fontWeight: FontWeight.w600,
                    wordSpacing: 0.3,
                    letterSpacing: 0.3),
              ),
            ),
            SizedBox(height: 10),
            CustomTextFeild(
              controller: _emailController,
            ),
            SizedBox(height: 10),
            CustomTextFeild(
              controller: _passController,
              suffix: Icon(Icons.visibility),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Forget Password?',
                )
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Sign In',
                ),
              ),
            ),
            SizedBox(height: 10),
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
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(AssetManager.googleLogo),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(AssetManager.googleLogo),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(AssetManager.googleLogo),
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

class CustomTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final Widget suffix;

  final double height;
  const CustomTextFeild({
    Key? key,
    required this.controller,
    this.suffix = const SizedBox(),
    this.height = 45,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: suffix,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            )),
      ),
    );
  }
}
