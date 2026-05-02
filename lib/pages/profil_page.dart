import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../models/profile_data.dart';
import 'edit_profil_page.dart';
import 'package:gym_app/widgets/bottom_nav_bar.dart';

class ProfilPage extends StatefulWidget {
  final ProfileData profile;

  const ProfilPage({super.key, required this.profile});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  late ProfileData profile;
  final int _currentIndex = 4;

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
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.button,
        title: Text(
          'Mon profil',
          style: TextStyle(color: AppColors.background),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),

              CircleAvatar(
                backgroundColor: AppColors.button,
                radius: 100,
                child: Text(
                  getInitiales(profile.name),
                  style: TextStyle(fontSize: 80, color: AppColors.background),
                ),
              ),

              SizedBox(height: 12),

              Text(
                profile.name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text,
                ),
              ),

              SizedBox(height: 4),

              Text(
                profile.profession,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: AppColors.textSecondary,
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Divider(
                  color: AppColors.textSecondary,
                  thickness: 0.5,
                  height: 30,
                ),
              ),

              SizedBox(height: 14),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'À PROPOS',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),

              SizedBox(height: 10),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  profile.bio,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w200,
                    color: AppColors.text,
                  ),
                ),
              ),

              SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    final ProfileData? result = await Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => EditProfilPage(
                          id: profile.id,
                          name: profile.name,
                          profession: profile.profession,
                          bio: profile.bio,
                        ),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                    if (result != null) {
                      setState(() {
                        profile = result;
                      });
                    }
                  },
                  child: Text(
                    'Modifier le profil',
                    style: TextStyle(color: AppColors.background, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
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
