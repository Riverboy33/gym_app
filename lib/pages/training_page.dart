import 'package:flutter/material.dart';
import 'package:gym_app/utils/app_colors.dart';
import 'package:gym_app/widgets/bottom_nav_bar.dart';
import 'package:gym_app/models/profile_data.dart';
import 'package:gym_app/widgets/create_square.dart';
import 'package:gym_app/pages/profil_page.dart';

class TrainingPage extends StatefulWidget {
  final ProfileData profile;
  const TrainingPage({super.key, required this.profile});

  @override
  State<TrainingPage> createState() => _TrainingPage();
}

class _TrainingPage extends State<TrainingPage> {
  late ProfileData profile;
  final int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    profile = widget.profile; // ← manquant
  }

  String getInitiales(String fullName) {
    List<String> parts = fullName.trim().split(' ');

    if (parts.length == 1) {
      return parts[0][0].toUpperCase();
    }
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final s = MediaQuery.of(context).size.shortestSide;

    return Scaffold(
      backgroundColor: AppColors.background,

      body: Padding(
        padding: EdgeInsets.only(
          left: s * 0.06,
          right: s * 0.06,
          top: s * 0.09,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Recherche des exercices',
                      hintStyle: TextStyle(
                        color: AppColors.background,
                        fontSize: s * 0.035,
                        fontFamily: 'ZonaPro',
                        fontWeight: FontWeight.w600,
                      ),
                      filled: true,
                      fillColor: AppColors.textSecondary,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: s * 0.03,
                        vertical: s * 0.01,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: AppColors.text),
                  ),
                ),

                SizedBox(width: s * 0.04),

                GestureDetector(
                  onTap: () {
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
                  child: CircleAvatar(
                    backgroundColor: AppColors.button,
                    radius: s * 0.09,
                    child: Text(
                      getInitiales(profile.name),
                      style: TextStyle(
                        fontSize: s * 0.07,
                        color: AppColors.background,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: h * 0.02),

            Stack(
              children: [
                CreateSquare(
                  imagePath: 'lib/assets/icons/running_man.png',
                  name: "CRÉER TA SEANCE",
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavBar(
        profile: profile,
        currentIndex: _currentIndex,
        onTap: (index) {},
        shorthestSide: s,
      ),
    );
  }
}
