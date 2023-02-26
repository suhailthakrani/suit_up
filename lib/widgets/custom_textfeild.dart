// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';

import 'package:suit_up/widgets/custom_text.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final Widget suffix;
  final String hintText;
  final String heading;
  final double height;
  InputDecoration? decoration;
  CustomTextFeild({
    Key? key,
    required this.controller,
    this.suffix = const SizedBox(),
    required this.hintText,
    required this.heading,
    this.height = 45,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "  $heading",
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.grey.shade700,
          ),
          HeightCustom(5),
          SizedBox(
            height: height * 0.6,
            child: TextFormField(
              controller: controller,
              decoration: decoration ??
                  InputDecoration(
                    suffixIcon: suffix,
                    hintText: hintText,
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
