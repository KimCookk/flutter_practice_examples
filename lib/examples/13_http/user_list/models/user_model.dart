class User {
  String name;
  String email;
  String city;

  User({
    required this.name,
    required this.email,
    required this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      city: json['address']['city'],
    );
  }
}
