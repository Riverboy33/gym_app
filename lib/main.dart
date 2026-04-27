import 'package:flutter/material.dart';
import 'package:gym_app/pages/login_page.dart';

import 'package:gym_app/pages/profil_page.dart';
import 'package:gym_app/models/profile_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilPage(
        profile: ProfileData(
          id: 1,
          name: "Jean Dupont",
          profession: "Développeur",
          bio: "Passionné de sport et de code.",
        ),
      ),
    );
  }
}
