import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../models/profile_data.dart';
import 'edit_profil_page.dart';

class ProfilPage extends StatefulWidget {
  final String name;
  final String profession;
  final String bio;

  const ProfilPage({
    super.key,
    required this.name,
    required this.profession,
    required this.bio,
  });

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  late String name;
  late String profession;
  late String bio;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    profession = widget.profession;
    bio = widget.bio;
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
                backgroundColor: AppColors.backgroundSecondary,
                radius: 100,
                child: Text(
                  getInitiales(name),
                  style: TextStyle(fontSize: 80, color: AppColors.background),
                ),
              ),

              SizedBox(height: 12),

              Text(
                name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text,
                ),
              ),

              SizedBox(height: 4),

              Text(
                profession,
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
                  bio,
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
                      MaterialPageRoute(
                        builder: (context) => EditProfilPage(
                          name: name,
                          profession: profession,
                          bio: bio,
                        ),
                      ),
                    );
                    if (result != null) {
                      setState(() {
                        name = result.name;
                        profession = result.profession;
                        bio = result.bio;
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
    );
  }
}
