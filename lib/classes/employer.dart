class Employer {
  int id;
  String username;
  String email;
  String password;
  String firstname;
  String lastname;
  String personalPhone;
  String description;
  String companyPhone;
  String companyName;
  String companyWeb;
  String contactCompanyEmail;

  Employer({
    this.id = 0,
    this.username = "",
    this.email = "",
    this.password = "",
    this.firstname = "",
    this.lastname = "",
    this.personalPhone = "",
    this.description = "",
    this.companyPhone = "",
    this.companyName = "",
    this.companyWeb = "",
    this.contactCompanyEmail = ""
  });

  factory Employer.fromJson(Map<String, dynamic> json) {
    return Employer(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      personalPhone: json['personalPhone'],
      description: json['description'],
      companyPhone: json['companyPhone'],
      companyName: json['companyName'],
      companyWeb: json['companyWeb'],
      contactCompanyEmail: json['contactCompanyEmail'],
    );
  }
}
