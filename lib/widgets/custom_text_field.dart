import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final int maxLength;
  final double shortestSide;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.maxLength,
    required this.shortestSide,
  });

  @override
  Widget build(BuildContext context) {
    final s = shortestSide;

    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: s * 0.05,
            fontWeight: FontWeight.w300,
            color: AppColors.text,
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: s * 0.25),
          child: TextField(
            controller: controller,
            maxLength: maxLength,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: AppColors.textSecondary),
            ),
          ),
        ),
      ],
    );
  }
}
