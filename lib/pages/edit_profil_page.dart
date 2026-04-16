import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';
import '../models/profile_data.dart';

class EditProfilPage extends StatefulWidget {
  final String name;
  final String profession;
  final String bio;

  const EditProfilPage({
    super.key,
    required this.name,
    required this.profession,
    required this.bio,
  });

  @override
  State<EditProfilPage> createState() => _EditProfilPage();
}

class _EditProfilPage extends State<EditProfilPage> {
  TextEditingController name = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController bio = TextEditingController();

  @override
  void initState() {
    super.initState();
    name.text = widget.name;
    profession.text = widget.profession;
    bio.text = widget.bio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.button,
        title: Text(
          'Modifier mon profil',
          style: TextStyle(color: AppColors.background),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Nom Prénom',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: AppColors.textSecondary,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: TextField(
                controller: name,
                maxLength: 25,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Entrez votre nom",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            SizedBox(height: 30),

            Text(
              'Profession',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: AppColors.textSecondary,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: TextField(
                controller: profession,
                maxLength: 25,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Entrez votre profession",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            SizedBox(height: 30),

            Text(
              'Bio',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: AppColors.textSecondary,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: TextField(
                controller: bio,
                maxLength: 50,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Entrez votre bio",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.button,
              ),
              onPressed: () {
                if (name.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Le nom est obligatoire"),
                    )
                  );
                  return;
                }
                Navigator.pop(
                  context,
                  ProfileData(
                    name: name.text,
                    profession: profession.text,
                    bio: bio.text,
                  ),
                );
              },
              child: Text(
                "Sauvegarder",
                style: TextStyle(color: AppColors.background),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    name.dispose();
    profession.dispose();
    bio.dispose();
    super.dispose();
  }
}
