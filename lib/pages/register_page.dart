import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/custom_text_field.dart';
import 'profil_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController bio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Inscription"),
        centerTitle: true,
        backgroundColor: AppColors.button,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              onPressed: () {
                if (name.text.trim().isEmpty) return;

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfilPage(
                      name: name.text,
                      profession: profession.text,
                      bio: bio.text,
                    ),
                  ),
                );
              },
              child: const Text("S'inscrire"),
            ),
          ],
        ),
      ),
    );
  }
}
