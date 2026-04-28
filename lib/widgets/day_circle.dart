import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class DayCircle extends StatelessWidget {
  final String label;
  final bool hasTraining;

  const DayCircle({
    super.key,
    required this.label,
    required this.hasTraining,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.button,
            radius: 25,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
                color: AppColors.background,
              ),
            ),
          ),

          const SizedBox(height: 5),

          Icon(
            Icons.brightness_1_rounded,
            color: hasTraining ? AppColors.text : AppColors.button,
            size: 10,
          ),
        ],
      ),
    );
  }
}