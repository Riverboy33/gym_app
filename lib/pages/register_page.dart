import 'package:flutter/material.dart';
import 'package:gym_app/pages/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/app_colors.dart';
import '../widgets/custom_text_field.dart';
import '../models/profile_data.dart';

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

  Future<Map<String, dynamic>> registerUser() async {
    final response = await http.post(
      Uri.parse("http://10.0.2.2:8000/users/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name.text.trim(),
        "profession": profession.text.trim(),
        "bio": bio.text.trim(),
      }),
    );

    debugPrint("BODY: ${response.body}");
    debugPrint("STATUS: ${response.statusCode}");

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("API error: ${response.body}");
    }

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return data;
    } else {
      throw Exception("Erreur création user");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          "Inscription",
          style: TextStyle(
            color: AppColors.background
          ),
        ),
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
                debugPrint("➡️ Avant POST");
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
                  final data = await registerUser();

                  final profile = ProfileData.fromJson(data);

                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                      HomePage(profile: profile),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
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
