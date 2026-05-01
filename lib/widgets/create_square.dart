import 'package:flutter/material.dart';
import 'package:gym_app/utils/app_colors.dart';

class CreateSquare extends StatelessWidget {
  final String name;
  final String imagePath;

  const CreateSquare({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: AppColors.button,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                imagePath,
                height: 200,
                width: 200,
                color: Colors.grey,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 140,
              child: Text(
                name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Fontspring',
                  fontSize: 25,
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
