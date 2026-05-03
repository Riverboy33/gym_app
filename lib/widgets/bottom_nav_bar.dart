import 'package:flutter/material.dart';
import 'package:gym_app/pages/home_page.dart';
import 'package:gym_app/pages/profil_page.dart';
import 'package:gym_app/models/profile_data.dart';
import 'package:gym_app/pages/success_page.dart';
import 'package:gym_app/pages/timer_page.dart';
import 'package:gym_app/pages/training_page.dart';
import '../utils/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final ProfileData profile;
  final int currentIndex;
  final Function(int) onTap;
  final double shorthestSide;

  const BottomNavBar({
    super.key,
    required this.profile,
    required this.currentIndex,
    required this.onTap,
    required this.shorthestSide,
  });

  @override
  Widget build(BuildContext context) {
    final s = shorthestSide;

    return Padding(
      padding: EdgeInsets.only(left: s * 0.06, right: s * 0.06, bottom: s * 0.09),
      child: Container(
        height: s * 0.13,
        decoration: BoxDecoration(
          color: AppColors.button,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Image.asset(
                'lib/assets/icons/train.png',
                color: currentIndex == 0
                    ? AppColors.text
                    : AppColors.textSecondary,
                colorBlendMode: BlendMode.srcIn,
              ),

              onPressed: () {
                onTap(0);
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        TrainingPage(profile: profile),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
            ),

            IconButton(
              icon: Image.asset(
                'lib/assets/icons/timer.png',
                color: currentIndex == 1
                    ? AppColors.text
                    : AppColors.textSecondary,
                colorBlendMode: BlendMode.srcIn,
              ),

              onPressed: () {
                onTap(1);
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        TimerPage(profile: profile),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
            ),

            IconButton(
              icon: Image.asset(
                'lib/assets/icons/home.png',
                color: currentIndex == 2
                    ? AppColors.text
                    : AppColors.textSecondary,
                colorBlendMode: BlendMode.srcIn,
              ),

              onPressed: () {
                onTap(2);
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        HomePage(profile: profile),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
            ),

            IconButton(
              icon: Image.asset(
                'lib/assets/icons/success.png',
                color: currentIndex == 3
                    ? AppColors.text
                    : AppColors.textSecondary,
                colorBlendMode: BlendMode.srcIn,
              ),

              onPressed: () {
                onTap(3);
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SuccessPage(profile: profile),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
            ),

            IconButton(
              icon: Image.asset(
                'lib/assets/icons/profil.png',
                color: currentIndex == 4
                    ? AppColors.text
                    : AppColors.textSecondary,
                colorBlendMode: BlendMode.srcIn,
              ),

              onPressed: () {
                onTap(4);
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ProfilPage(profile: profile),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
