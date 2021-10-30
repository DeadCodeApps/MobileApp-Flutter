class Freelancer {
  final int id;
  final String username;
  final String email;
  final String firstname;
  final String lastname;

  Freelancer({
    required this.id,
    required this.username,
    required this.email,
    required this.firstname,
    required this.lastname,
  });

  factory Freelancer.fromJson(Map<String, dynamic> json) {
    return Freelancer(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstname: json['firstname'],
      lastname: json['lastname'],
    );
  }
}