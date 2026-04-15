import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProfilPage());
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

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String name = "Emilien Arnaud";
  String profession = "Développeur Roblox";
  String bio = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 60, 54, 54),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 29, 158, 117),
        title: Text('Mon profil', style: TextStyle(color: Colors.white)),
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
                backgroundColor: const Color.fromARGB(255, 147, 239, 199),
                radius: 100,
                child: Text(
                  'EA',
                  style: TextStyle(
                    fontSize: 80,
                    color: Color.fromARGB(255, 25, 82, 42),
                  ),
                ),
              ),

              SizedBox(height: 12),

              Text(
                name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 4),

              Text(
                profession,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: const Color.fromARGB(255, 180, 180, 180),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Divider(
                  color: Colors.grey.shade700,
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
                    color: Colors.grey,
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
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 29, 158, 117),
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
                    style: TextStyle(color: Colors.white, fontSize: 20),
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

  const EditProfilPage({super.key,
    required this.name,
    required this.profession,
    required this.bio});

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
      backgroundColor: const Color.fromARGB(255, 60, 54, 54),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 29, 158, 117),
        title: Text(
          'Modifier mon profil',
          style: TextStyle(color: Colors.white),
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
                color: const Color.fromARGB(255, 180, 180, 180),
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
                color: const Color.fromARGB(255, 180, 180, 180),
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
                color: const Color.fromARGB(255, 180, 180, 180),
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
                backgroundColor: Color.fromARGB(255, 29, 158, 117),
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
                style: TextStyle(color: Colors.white)
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
