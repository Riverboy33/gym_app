import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/app_colors.dart';
import '../widgets/custom_text_field.dart';
import 'profil_page.dart';

class RegisterPage extends StatefulWidget {
  final String defaultName;

  const RegisterPage({
    super.key,
    required this.defaultName,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController bio = TextEditingController();

  @override
  void initState() {
    super.initState();
    name.text = widget.defaultName;
  }

  Future<void> registerUser() async {
    final response = await http.post(
      Uri.parse("http://127.0.0.1:8000/users/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name.text.trim(),
        "profession": profession.text.trim(),
        "bio": bio.text.trim(),
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint("User créé");
    } else {
      throw Exception("Erreur création user");
    }
  }

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
              controller: profession,
              label: "Profession",
              hint: "Votre profession",
              maxLength: 20,
            ),
            
            CustomTextField(
              controller: bio,
              label: "Décrivez vous",
              hint: "Entrez votre bio",
              maxLength: 50,
            ),

            ElevatedButton(
              onPressed: () async {
                print("➡️ Avant POST");
                if (name.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Le nom est obligatoire"),
                    ),
                  );
                  return;
                }

                try {
                  await registerUser();

                  if (!context.mounted) return;

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
                } catch (e) {
                  debugPrint(e.toString());

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Erreur API")),
                  );
                }
              },
              child: const Text("S'inscrire"),
            ),
          ],
        ),
      ),
    );
  }
}
