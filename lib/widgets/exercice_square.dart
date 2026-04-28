import 'package:flutter/material.dart';
import 'package:gym_app/utils/app_colors.dart';

class ExerciceSquare extends StatelessWidget {
  final String exerciceName;
  final int nbSeries;
  final int nbReps;

  const ExerciceSquare({
    super.key,
    required this.exerciceName,
    required this.nbSeries,
    required this.nbReps,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        color: AppColors.button,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              'lib/assets/icons/train.png',
              height: 130,
              width: 130,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            exerciceName,
            style: TextStyle(
              fontFamily: 'Fontspring',
              fontSize: 15,
              color: AppColors.background,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            "nb SERIES x nb REPS",
            style: TextStyle(
              color: AppColors.background,
              fontFamily: 'ZonaPro',
              fontSize: 9,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
