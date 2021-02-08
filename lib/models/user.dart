class AppUser {
  final String id;
  final String email;
  final String name;

  AppUser({this.id, this.email, this.name});

  AppUser.fromData(Map<String, dynamic> data)
      : id = data['id'],
        email = data['email'],
        name = data['name'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
    };
  }
}
