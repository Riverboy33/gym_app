import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/app_colors.dart';
import '../widgets/custom_text_field.dart';
import 'profil_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController name = TextEditingController();

  Future<void> loginUser() async {
    final response = await http.post(
      Uri.parse("http://127.0.0.1:8000/login/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name.text.trim()}),
    );

    if (!context.mounted) return;

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ProfilPage(
            name: data["name"],
            profession: data["profession"] ?? "",
            bio: data["bio"] ?? "",
          ),
        ),
      );
    } else if (response.statusCode == 404) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => RegisterPage(defaultName: name.text)),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Erreur serveur")));
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
              controller: name,
              label: "Quel est votre Nom et Prenom ?",
              hint: "Entrez votre nom",
              maxLength: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (name.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Le nom est obligatoire"),
                    ),
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
