import 'package:flutter/material.dart';
import 'package:gym_app/models/profile_data.dart';
import 'package:gym_app/utils/app_colors.dart';
import 'package:gym_app/widgets/bottom_nav_bar.dart';

class TimerPage extends StatefulWidget {
  final ProfileData profile;
  const TimerPage({super.key, required this.profile});

  @override
  State<TimerPage> createState() => _TimerPage();
}

class _TimerPage extends State<TimerPage> {
  late ProfileData profile;
  final int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    profile = widget.profile;  // ← manquant
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.button,
        title: Text('Vos temps', style: TextStyle(color: AppColors.background)),
      ),

      body: Stack(children: [
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
