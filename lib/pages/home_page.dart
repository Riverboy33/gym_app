import 'package:flutter/material.dart';
import 'package:gym_app/models/profile_data.dart';
import 'package:gym_app/pages/profil_page.dart';
import 'package:gym_app/utils/app_colors.dart';
import 'package:gym_app/widgets/bottom_nav_bar.dart';
import 'package:gym_app/widgets/day_circle.dart';
import 'package:gym_app/pages/training_page.dart';

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
    profile = widget.profile;  // ← manquant
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Bonjour Gregoire",
                            style: TextStyle(
                              color: AppColors.button,
                              fontFamily: 'Fairweather',
                              fontSize: 50,
                            ),
                          ),

                          Text(
                            "Lundi 28 Avril 2026",
                            style: TextStyle(
                              fontFamily: 'ZonaPro',
                              fontSize: 20,
                              color: AppColors.text,
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProfilPage(profile: profile),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.button,
                        radius: 40,
                        child: Text(
                          "GR",
                          style: TextStyle(
                            fontSize: 30,
                            color: AppColors.background,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "CETTE SEMAINE",
                      style: TextStyle(
                        fontFamily: 'Fontspring',
                        fontSize: 25,
                        color: AppColors.button,
                      ),
                    ),

                    Transform.translate(
                      offset: Offset(0, 1.5),
                      child: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DayCircle(label: "L", hasTraining: true),
                    DayCircle(label: "M", hasTraining: true),
                    DayCircle(label: "M", hasTraining: false),
                    DayCircle(label: "J", hasTraining: true),
                    DayCircle(label: "V", hasTraining: true),
                    DayCircle(label: "S", hasTraining: false),
                    DayCircle(label: "D", hasTraining: false),
                  ]
                ),

                const SizedBox(height: 50),

                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TrainingPage(profile: profile),
                      ),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "SEANCE DU JOUR",
                        style: TextStyle(
                          fontFamily: 'Fontspring',
                          fontSize: 25,
                          color: AppColors.button,
                        ),
                      ),

                      Transform.translate(
                        offset: Offset(0, 1.5),
                        child: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColors.button,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Container(
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColors.button,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Container(
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColors.button,
                        borderRadius: BorderRadius.circular(25),
                      ),
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
        onTap: (index) {},
      ),
    );
  }
}
