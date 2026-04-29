import 'package:flutter/material.dart';
import 'package:gym_app/pages/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/app_colors.dart';
import '../widgets/custom_text_field.dart';
import 'profil_page.dart';
import 'register_page.dart';
import '../models/profile_data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();

  Future<void> loginUser() async {
    try {
      print("➡️ LOGIN CLICK");

      final response = await http.post(
        Uri.parse("http://127.0.0.1:8000/login/"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"name": nameController.text.trim()}),
      );

      print("STATUS: ${response.statusCode}");
      print("BODY: ${response.body}");

      if (!context.mounted) return;

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final profile = ProfileData.fromJson(data);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePage(profile: profile)),
        );
      } else if (response.statusCode == 404) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => RegisterPage(defaultName: nameController.text),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erreur serveur: ${response.statusCode}")),
        );
      }
    } catch (e) {
      print("ERROR: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur réseau")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          "Connexion",
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
              controller: nameController,
              label: "Quel est votre Nom et Prenom ?",
              hint: "Entrez votre nom",
              maxLength: 20,
            ),

            ElevatedButton(
              onPressed: () async {
                print("🔥 BUTTON CLICKED");
                if (nameController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Le nom est obligatoire")),
                  );
                  return;
                }

                await loginUser();
              },
              child: const Text("Se connecter"),
            ),
          ],
        ),
      ),
    );
  }
}
