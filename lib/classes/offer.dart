import 'package:stateful_widget/classes/speacialty.dart';

class Offer {
  final int id;
  final String title;
  final String description;
  final double paymentAmount;
  final int monthDuration;
  final Specialty specialty;

  Offer(
      {required this.id,
      required this.title,
      required this.description,
      required this.paymentAmount,
      required this.monthDuration,
      required this.specialty});

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      paymentAmount: json['paymentAmount'],
      monthDuration: json['monthDuration'],
      specialty: Specialty.fromJson(json['specialty']),
    );
  }
}
