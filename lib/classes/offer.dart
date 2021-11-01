import 'package:stateful_widget/classes/speacialty.dart';

class Offer {
  final int id;
  final String title;
  final String description;
  final double paymentAmount;
  final int monthDuration;
  final Specialty specialty;
  final DateTime startDate;
  final DateTime endDate;

  Offer(
      {required this.id,
      required this.title,
      required this.description,
      required this.paymentAmount,
      required this.monthDuration,
      required this.specialty,
      required this.startDate,
      required this.endDate});

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      paymentAmount: json['paymentAmount'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      monthDuration: json['monthDuration'],
      specialty: Specialty.fromJson(
        json['specialty'],
      ),
    );
  }
}
