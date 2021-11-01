class Freelancer {
  int id;
  String username;
  String email;
  String password;
  String firstname;
  String lastname;
  String birthDate;
  String phone;
  String description;
  String profession;

  Freelancer({
    this.id = 0,
    this.username = "",
    this.email = "",
    this.password = "",
    this.firstname = "",
    this.lastname = "",
    this.birthDate = "",
    this.phone = "",
    this.description = "",
    this.profession = ""
  });

  factory Freelancer.fromJson(Map<String, dynamic> json) {
    return Freelancer(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        password: json['password'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        birthDate: json['birthDate'],
        phone: json['phone'],
        description: json['description'],
        profession: json['profession']);
  }
}
