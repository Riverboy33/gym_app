import 'package:flutter/material.dart';
import 'package:gym_app/pages/home_page.dart';
import 'package:gym_app/pages/profil_page.dart';
import 'package:gym_app/models/profile_data.dart';
import 'package:gym_app/pages/success_page.dart';
import 'package:gym_app/pages/timer_page.dart';
import 'package:gym_app/pages/training_page.dart';
import '../utils/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        height: 60,
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
                  MaterialPageRoute(
                    builder: (_) => TrainingPage(),
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
                  MaterialPageRoute(
                    builder: (_) => TimerPage(),
                  ),
                );
              },
            ),

            IconButton(
              iconSize: 30,
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
                  MaterialPageRoute(
                    builder: (_) => HomePage()
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
                  MaterialPageRoute(
                    builder: (_) => SuccessPage(),
                  ),
                );
              },
            ),

            IconButton(
              iconSize: 30,
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
                  MaterialPageRoute(
                    builder: (_) => ProfilPage(
                      profile: ProfileData(
                        id: 22,
                        name: "Gregoire",
                        profession: "test",
                        bio: "test",
                      ),
                    ),
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
