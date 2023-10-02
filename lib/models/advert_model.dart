class AdvertModel {
  String uid;
  String company;
  String image;
  DateTime startDate;
  DateTime endDate;
  String? color;
  String url;

  AdvertModel({
    required this.uid,
    required this.company,
    required this.image,
    required this.startDate,
    required this.endDate,
    this.color,
    required this.url,
  });

  factory AdvertModel.fromMap(map) {
    return AdvertModel(
      uid: map['uid'],
      company: map['company'],
      image: map['image'],
      startDate: map['startDate'].toDate(),
      endDate: map['endDate'].toDate(),
      color: map['color'],
      url: map['url'],
    );
  }

  AdvertModel.fromSnaphot(snapshot)
      : uid = snapshot.data()['uid'],
        company = snapshot.data()['company'],
        image = snapshot.data()['image'],
        startDate = snapshot.data()['startDate'].toDate(),
        endDate = snapshot.data()['endDate'].toDate(),
        color = snapshot.data()['color'],
        url = snapshot.data()['url'];

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'company': company,
      'image': image,
      'startDate': startDate,
      'endDate': endDate,
      'color': color,
      'url': url,
    };
  }
}
