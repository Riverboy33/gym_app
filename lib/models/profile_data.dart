class ProfileData {
  final int id;
  final String name;
  final String profession;
  final String bio;

  ProfileData({
    required this.id,
    required this.name,
    required this.profession,
    required this.bio,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json["id"],
      name: json["name"],
      profession: json["profession"] ?? "",
      bio: json["bio"] ?? "",
    );
  }
}
