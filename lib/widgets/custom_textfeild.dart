// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final Widget suffix;
  final String hintText;
  final double height;
  InputDecoration? decoration;
  CustomTextFeild({
    Key? key,
    required this.controller,
    this.suffix = const SizedBox(),
    required this.hintText,
    this.height = 45,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
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
    );
  }
}
