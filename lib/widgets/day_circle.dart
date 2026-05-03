import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class DayCircle extends StatelessWidget {
  final String label;
  final bool hasTraining;
  final double shorthestSide;

  const DayCircle({
    super.key,
    required this.label,
    required this.hasTraining,
    required this.shorthestSide,
  });

  @override
  Widget build(BuildContext context) {
    final s = shorthestSide;

    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.button,
            radius: s * 0.05,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize:s * 0.06,
                color: AppColors.background,
              ),
            ),
          ),

          SizedBox(height: s * 0.01),

          Icon(
            Icons.brightness_1_rounded,
            color: hasTraining ? AppColors.text : AppColors.button,
            size: s * 0.02,
          ),
        ],
      ),
    );
  }
}
