import 'package:flutter/material.dart';
import 'package:gym_app/utils/app_colors.dart';
import 'package:gym_app/widgets/bottom_nav_bar.dart';
import 'package:gym_app/models/profile_data.dart';

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
    profile = widget.profile;  // ← manquant
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.button,
        title: Text(
          'Entrainement',
          style: TextStyle(color: AppColors.background),
        ),
      ),

      body: Stack(
        children: [
        ],
      ),

      bottomNavigationBar: BottomNavBar(
        profile: profile,
        currentIndex: _currentIndex,
        onTap: (index) {
        },
      ),
    );
  }
}
