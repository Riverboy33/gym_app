import 'package:flutter/material.dart';
import 'package:gym_app/models/profile_data.dart';
import 'package:gym_app/pages/profil_page.dart';
import 'package:gym_app/utils/app_colors.dart';
import 'package:gym_app/widgets/bottom_nav_bar.dart';
import 'package:gym_app/widgets/day_circle.dart';
import 'package:gym_app/pages/training_page.dart';
import 'package:gym_app/widgets/exercice_square.dart';

class HomePage extends StatefulWidget {
  final ProfileData profile;
  const HomePage({super.key, required this.profile});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late ProfileData profile;
  final int _currentIndex = 2;

  @override
  void initState() {
    super.initState();
    profile = widget.profile;
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

      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: s * 0.06, right: s * 0.06, top: s * 0.09),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Bonjour ${profile.name}",
                            style: TextStyle(
                              color: AppColors.button,
                              fontFamily: 'Fairweather',
                              fontSize: s * 0.1,
                            ),
                          ),

                          Text(
                            "Lundi 28 Avril 2026",
                            style: TextStyle(
                              fontFamily: 'ZonaPro',
                              fontSize: s * 0.045,
                              color: AppColors.text,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => ProfilPage(
                              profile: profile
                            ),
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

                SizedBox(height: h * 0.04),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "CETTE SEMAINE",
                      style: TextStyle(
                        fontFamily: 'Fontspring',
                        fontSize: s * 0.055,
                        color: AppColors.button,
                      ),
                    ),

                    Transform.translate(
                      offset: Offset(0, s * 0.005),
                      child: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.015),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DayCircle(label: "L", hasTraining: true, shorthestSide: s),
                    DayCircle(label: "M", hasTraining: true, shorthestSide: s),
                    DayCircle(label: "M", hasTraining: false, shorthestSide: s),
                    DayCircle(label: "J", hasTraining: true, shorthestSide: s),
                    DayCircle(label: "V", hasTraining: true, shorthestSide: s),
                    DayCircle(label: "S", hasTraining: false, shorthestSide: s),
                    DayCircle(label: "D", hasTraining: false, shorthestSide: s),
                  ],
                ),

                SizedBox(height: h * 0.03),

                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => TrainingPage(
                          profile: profile
                        ),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "SEANCE DU JOUR",
                            style: TextStyle(
                              fontFamily: 'Fontspring',
                              fontSize: s * 0.055,
                              color: AppColors.button,
                            ),
                          ),

                          Transform.translate(
                            offset: Offset(0, s * 0.005),
                            child: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ],
                      ),

                      Text(
                        "DOS + PEC + EPAULES",
                        style: TextStyle(
                          color: AppColors.text,
                          fontFamily: 'ZonaPro',
                          fontSize: s * 0.03,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ]
                  ),
                ),

                SizedBox(height: h * 0.025),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ExerciceSquare(
                      imagePath: 'lib/assets/icons/train.png',
                      exerciceName: "BENCH PRESS",
                      nbSeries: 4,
                      nbReps: 10,
                      shorthestSide: s,
                    ),

                    ExerciceSquare(
                      imagePath: 'lib/assets/icons/train.png',
                      exerciceName: "DEADLIFT",
                      nbSeries: 4,
                      nbReps: 10,
                      shorthestSide: s,
                    ),

                    ExerciceSquare(
                      imagePath: 'lib/assets/icons/train.png',
                      exerciceName: "SHOULDER PRESS",
                      nbSeries: 4,
                      nbReps: 10,
                      shorthestSide: s,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavBar(
        profile: profile,
        currentIndex: _currentIndex,
        onTap: (index) {
        },
        shorthestSide: s,
      ),
    );
  }
}
