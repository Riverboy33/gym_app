import 'package:flutter/material.dart';
import 'package:gym_app/utils/app_colors.dart';

class CreateSquare extends StatelessWidget {
  final String name;
  final String imagePath;
  final double shortestSide;

  const CreateSquare({
    super.key,
    required this.name,
    required this.imagePath,
    required this.shortestSide,
  });

  @override
  Widget build(BuildContext context) {
    final s = shortestSide;

    return Container(
      height: s * 0.48,
      width: s * 0.48,
      decoration: BoxDecoration(
        color: AppColors.button,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: s * 0.01),
              child: Image.asset(
                imagePath,
                height: s * 0.48,
                width: s * 0.48,
                color: Colors.grey,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: s * 0.30,
              child: Text(
                name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Fontspring',
                  fontSize: s * 0.06,
                  color: AppColors.text,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
