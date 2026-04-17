import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../models/profile_data.dart';
import '../widgets/custom_text_field.dart';

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
            CustomTextField(
              controller: name,
              label: "Quel est votre Nom et Prenom ?",
              hint: "Entrez votre nom",
              maxLength: 20,
            ),
            
            CustomTextField(
              controller: profession,
              label: "Quelle est votre profession ?",
              hint: "Entrez votre profession",
              maxLength: 20,
            ),

            CustomTextField(
              controller: bio,
              label: "Décrivez vous",
              hint: "Entrez votre bio",
              maxLength: 50,
            ),

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
