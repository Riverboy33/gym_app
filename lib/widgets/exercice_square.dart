import 'package:flutter/material.dart';
import 'package:gym_app/utils/app_colors.dart';

class ExerciceSquare extends StatelessWidget {
  final String exerciceName;
  final String imagePath;
  final int nbSeries;
  final int nbReps;
  final double shorthestSide;

  const ExerciceSquare({
    super.key,
    required this.exerciceName,
    required this.imagePath,
    required this.nbSeries,
    required this.nbReps,
    required this.shorthestSide,
  });

  @override
  Widget build(BuildContext context) {
    final s = shorthestSide;

    return Container(
      height: s * 0.35,
      width: s * 0.26,
      decoration: BoxDecoration(
        color: AppColors.button,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: s * 0.03),
            child: Image.asset(
              imagePath,
              height: s * 0.2,
              width: s * 0.2,
            ),
          ),

          SizedBox(height: s * 0.01),

          Text(
            exerciceName,
            style: TextStyle(
              fontFamily: 'Fontspring',
              fontSize: s * 0.025,
              color: AppColors.background,
            ),
          ),

          SizedBox(height: s * 0.002),

          Text(
            "$nbSeries SERIES x $nbReps REPS",
            style: TextStyle(
              color: AppColors.background,
              fontFamily: 'ZonaPro',
              fontSize: s * 0.019,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
