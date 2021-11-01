class Postulation {
  final int desiredPayment;
  final String description;

  Postulation({required this.desiredPayment, required this.description});

  factory Postulation.fromJson(Map<String, dynamic> json) {
    return Postulation(
        desiredPayment: json['desiredPayment'],
        description: json['description']);
  }
}
