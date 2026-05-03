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
    final h = MediaQuery.of(context).size.height;
    final s = MediaQuery.of(context).size.shortestSide;

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
        padding: EdgeInsets.symmetric(horizontal: s * 0.06),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: h * 0.02),

              CircleAvatar(
                backgroundColor: AppColors.button,
                radius: s * 0.25,
                child: Text(
                  getInitiales(profile.name),
                  style: TextStyle(
                    fontSize: s * 0.2,
                    color: AppColors.background,
                  ),
                ),
              ),

              SizedBox(height: h * 0.012),

              Text(
                profile.name,
                style: TextStyle(
                  fontSize: s * 0.075,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text,
                ),
              ),

              SizedBox(height: h * 0.004),

              Text(
                profile.profession,
                style: TextStyle(
                  fontSize: s * 0.05,
                  fontWeight: FontWeight.w300,
                  color: AppColors.textSecondary,
                ),
              ),

              Divider(
                color: AppColors.textSecondary,
                thickness: s * 0.0009,
                height: s * 0.15,
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'À PROPOS',
                  style: TextStyle(
                    fontSize: s * 0.048,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),

              SizedBox(height: h * 0.01),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  profile.bio,
                  style: TextStyle(
                    fontSize: s * 0.045,
                    fontWeight: FontWeight.w300,
                    color: AppColors.text,
                  ),
                ),
              ),

              SizedBox(height: h * 0.035),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button,
                    padding: EdgeInsets.symmetric(vertical: s * 0.075),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    final ProfileData? result = await Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            EditProfilPage(
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
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: s * 0.05
                    ),
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
        onTap: (index) {},
        shorthestSide: s,
      ),
    );
  }
}
