import 'package:flutter/material.dart';
import 'package:gym_app/utils/app_colors.dart';
import 'package:gym_app/widgets/bottom_nav_bar.dart';
import 'package:gym_app/models/profile_data.dart';

class SuccessPage extends StatefulWidget {
  final ProfileData profile;
  const SuccessPage({super.key, required this.profile});

  @override
  State<SuccessPage> createState() => _SuccessPage();
}

class _SuccessPage extends State<SuccessPage> {
  late ProfileData profile;
  final int _currentIndex = 3;

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
          'Succès',
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
