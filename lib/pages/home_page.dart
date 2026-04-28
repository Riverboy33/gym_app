import 'package:flutter/material.dart';
import 'package:gym_app/utils/app_colors.dart';
import 'package:gym_app/widgets/bottom_nav_bar.dart';

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
                    Expanded(child:
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.button,
                            radius: 25,
                            child: Text(
                              "L",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: AppColors.background,
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          Icon(
                            Icons.brightness_1_rounded,
                            color: AppColors.text,
                            size: 10,
                          ),
                        ],
                      ),
                    ),

                    Expanded(child:
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.button,
                            radius: 25,
                            child: Text(
                              "M",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: AppColors.background,
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          Icon(
                            Icons.brightness_1_rounded,
                            color: AppColors.text,
                            size: 10,
                          ),
                        ],
                      ),
                    ),

                    Expanded(child:
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.button,
                            radius: 25,
                            child: Text(
                              "M",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: AppColors.background,
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          Icon(
                            Icons.brightness_1_rounded,
                            color: AppColors.button,
                            size: 10,
                          ),
                        ],
                      ),
                    ),

                    Expanded(child:
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.button,
                            radius: 25,
                            child: Text(
                              "J",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: AppColors.background,
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          Icon(
                            Icons.brightness_1_rounded,
                            color: AppColors.text,
                            size: 10,
                          ),
                        ],
                      ),
                    ),

                    Expanded(child:
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.button,
                            radius: 25,
                            child: Text(
                              "V",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: AppColors.background,
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          Icon(
                            Icons.brightness_1_rounded,
                            color: AppColors.text,
                            size: 10,
                          ),
                        ],
                      ),
                    ),

                    Expanded(child:
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.button,
                            radius: 25,
                            child: Text(
                              "S",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: AppColors.background,
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          Icon(
                            Icons.brightness_1_rounded,
                            color: AppColors.button,
                            size: 10,
                          ),
                        ],
                      ),
                    ),

                    Expanded(child:
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.button,
                            radius: 25,
                            child: Text(
                              "D",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: AppColors.background,
                              ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          Icon(
                            Icons.brightness_1_rounded,
                            color: AppColors.button,
                            size: 10,
                          ),
                        ],
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
        currentIndex: _currentIndex,
        onTap: (index) {},
      ),
    );
  }
}
