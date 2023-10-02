import 'package:app/models/user_model.dart';

class ReviewModel {
  String id;
  DateTime date;
  Map customer;
  String labourer;
  String details;
  double rating;

  ReviewModel({
    required this.id,
    required this.date,
    required this.customer,
    required this.labourer,
    required this.details,
    required this.rating,
  });

  factory ReviewModel.fromMap(map) {
    return ReviewModel(
      id: map['id'],
      date: map['date'].toDate(),
      customer: map['customer'],
      labourer: map['labourer'],
      details: map['details'],
      rating: map['rating'],
    );
  }

  ReviewModel.fromSnaphot(snapshot)
      : id = snapshot.data()['id'],
        date = snapshot.data()['date'].toDate(),
        customer = snapshot.data()['customer'],
        labourer = snapshot.data()['labourer'],
        details = snapshot.data()['details'],
        rating = snapshot.data()['rating'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'customer': customer,
      'labourer': labourer,
      'details': details,
      'rating': rating,
    };
  }
}
