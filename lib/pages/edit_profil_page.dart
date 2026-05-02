import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/app_colors.dart';
import '../models/profile_data.dart';
import '../widgets/custom_text_field.dart';

class EditProfilPage extends StatefulWidget {
  final int id;
  final String name;
  final String profession;
  final String bio;

  const EditProfilPage({
    super.key,
    required this.id,
    required this.name,
    required this.profession,
    required this.bio,
  });

  @override
  State<EditProfilPage> createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
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
              onPressed: () async {
                if (name.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Le nom est obligatoire"),
                    ),
                  );
                  return;
                }

                final response = await http.put(
                  Uri.parse("http://10.0.2.2:8000/users/${widget.id}"),
                  headers: {"Content-Type": "application/json"},
                  body: jsonEncode({
                    "name": name.text.trim(),
                    "profession": profession.text.trim(),
                    "bio": bio.text.trim(),
                  }),
                );

                if (!context.mounted) return;

                if (response.statusCode == 200) {
                  Navigator.pop(
                    context,
                    ProfileData(
                      id: widget.id,
                      name: name.text.trim(),
                      profession: profession.text.trim(),
                      bio: bio.text.trim(),
                    )
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Erreur mise à jour")),
                  );
                }
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
