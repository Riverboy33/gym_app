import 'package:flutter/material.dart';
import 'package:gym_app/utils/app_colors.dart';
import 'package:gym_app/widgets/bottom_nav_bar.dart';
import 'package:gym_app/widgets/day_circle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final int _currentIndex = 2;

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

                    Expanded(
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
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {},
      ),
    );
  }
}
