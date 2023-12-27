class UserModels {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  const UserModels({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.id,
  });
  
  factory UserModels.fromJson(Map<String, dynamic> json) {
    return UserModels(
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      avatar: json["avatar"],
      id: json["id"],
    );
  }

  static List<UserModels> userFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return UserModels.fromJson(data);
    }).toList();
  }
}
