import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage(),
    );
  }
}

class ProfileData {
  final String name;
  final String profession;
  final String bio;

  ProfileData({
    required this.name,
    required this.profession,
    required this.bio,
  });
}

class AppColors {
  static const Color background = Color.fromARGB(255, 54, 73, 78);
  static const Color backgroundSecondary = Color.fromARGB(255, 169, 206, 244);
  static const Color text = Colors.white;
  static const Color textSecondary = Color.fromARGB(255, 89, 112, 129);
  static const Color button = Color.fromARGB(255, 126, 160, 183);
}

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
        centerTitle: true,
        backgroundColor: AppColors.button,
        title: Text(
          'Inscription',
          style: TextStyle(color: AppColors.background),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Quel est votre Nom et Prenom ?',
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
              'Quelle est votre profession ?',
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
              'Décrivez vous.',
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilPage(
                      name: name.text,
                      profession: profession.text,
                      bio: bio.text,
                    ),
                  ),
                );
              },
              child: Text(
                "S'inscrire",
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
    name = widget.name;        // ← String, pas .text
    profession = widget.profession;
    bio = widget.bio;
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
                  'EA',
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
