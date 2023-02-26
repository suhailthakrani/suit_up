// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final VoidCallback onPressed;
  EdgeInsets? padding;
  ButtonStyle? style;
  CustomButton({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
    required this.onPressed,
    this.padding,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style ??
            ElevatedButton.styleFrom(
              padding: padding??const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: Colors.white,
            ),
        child: child,
      ),
    );
  }
}
