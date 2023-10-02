class BookingModel {
  String? id;
  DateTime? date;
  String? startTime;
  String? endTime;
  int? duration;
  String? details;
  String? category;
  String? address;
  double? lat;
  double? lng;
  Map? customer;
  Map? labourer;
  String? status;
  bool? reviewed;
  num? amount;

  BookingModel({
    this.id,
    this.date,
    this.startTime,
    this.endTime,
    this.duration,
    this.details,
    this.category,
    this.address,
    this.lat,
    this.lng,
    this.customer,
    this.labourer,
    this.status,
    this.reviewed,
    this.amount
  });

  factory BookingModel.fromMap(map) {
    return BookingModel(
      id: map['id'],
      date: map['date'].toDate(),
      startTime: map['startTime'],
      endTime: map['endTime'],
      duration: map['duration'],
      details: map['details'],
      category: map['category'],
      address: map['address'],
      lat: map['lat'],
      lng: map['lng'],
      customer: map['customer'],
      labourer: map['labourer'],
      status: map['status'],
      reviewed: map['reviewed'],
      amount: map['amount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'duration': duration,
      'details': details,
      'category': category,
      'address': address,
      'lat': lat,
      'lng': lng,
      'customer': customer,
      'labourer': labourer,
      'status': status,
      'reviewed': reviewed,
      'amount': amount,
    };
  }
}
