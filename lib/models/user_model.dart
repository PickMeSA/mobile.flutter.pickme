import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? fullName;
  String? email;
  String? mobile;
  String? userRole;
  String? satelliteOfficeId;
  bool? enabled;
  String? profileImage;
  String? tagline;
  String? about;
  String? address;
  double? lat;
  double? lng;
  num? rate;
  num? overallRating;
  int? numberOfReviews;
  List? serviceCategories;
  DateTime? lastReadDate;
  String? labourerType;
  List? imageGallery;

  String? membership;
  String? workExperience;
  String? pushToken;

// receiving data
  UserModel({
    this.uid,
    this.fullName,
    this.email,
    this.mobile,
    this.userRole,
    this.satelliteOfficeId,
    this.enabled,
    this.profileImage,
    this.tagline,
    this.about,
    this.address,
    this.lat,
    this.lng,
    this.rate,
    this.overallRating,
    this.numberOfReviews,
    this.serviceCategories,
    this.labourerType,
    this.imageGallery,
    this.membership,
    this.workExperience,
    this.pushToken,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      fullName: map['fullName'],
      email: map['email'],
      mobile: map['mobile'],
      userRole: map['userRole'],
      //satelliteOfficeId: map['satelliteOfficeId'],
      enabled: map['enabled'],
      profileImage: map['profileImage'],
      tagline: map['tagline'],
      about: map['about'],
      address: map['address'],
      lat: map['lat'],
      lng: map['lng'],
      rate: map['rate'],
      overallRating: map['overallRating'],
      numberOfReviews: map['numberOfReviews'],
      serviceCategories: map['serviceCategories'],
      labourerType: map['labourerType'],
      imageGallery: map['imageGallery'],
      membership: map['membership'],
      workExperience: map['workExperience'],
      pushToken: map['pushToken'],
    );
  }

  factory UserModel.customerFromMap(map) {
    return UserModel(
      uid: map['uid'],
      fullName: map['fullName'],
      email: map['email'],
      mobile: map['mobile'],
      userRole: map['userRole'],
      enabled: map['enabled'],
      profileImage: map['profileImage'],
      //membership: map['membership'],
      //workExperience: map['workExperience'],
      pushToken: map['pushToken'],
    );
  }

  factory UserModel.chatUserFromMap(map) {
    return UserModel(
      uid: map['uid'],
      fullName: map['fullName'],
      mobile: map['mobile'],
      email: map['email'],
      profileImage: map['profileImage'],
      pushToken: map['pushToken'],
    );
  }

  UserModel.fromSnapshot(snapshot)
      : uid = snapshot.data()['uid'],
        overallRating = snapshot.data()['overallRating'],
        rate = snapshot.data()['rate'],
        about = snapshot.data()['about'],
        lat = snapshot.data()['lat'],
        lng = snapshot.data()['lng'],
        address = snapshot.data()['address'],
        serviceCategories = snapshot.data()['serviceCategories'],
        tagline = snapshot.data()['tagline'],
        numberOfReviews = snapshot.data()['numberOfReviews'],
        fullName = snapshot.data()['fullName'],
        profileImage = snapshot.data()['profileImage'],
        workExperience = snapshot.data()['workExperience'],
        membership = snapshot.data()['membership'];

// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'mobile': mobile,
      'userRole': userRole,
      'satelliteOfficeId': satelliteOfficeId,
      'enabled': enabled,
      'profileImage': profileImage,
      'tagline': tagline,
      'about': about,
      'address': address,
      'lat': lat,
      'lng': lng,
      'rate': rate,
      'overallRating': overallRating,
      'numberOfReviews': numberOfReviews,
      'serviceCategories': serviceCategories,
    };
  }

  Map<String, dynamic> toBookingLabourerMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'mobile': mobile,
      'profileImage': profileImage,
      'tagline': tagline,
      'pushToken': pushToken,
    };
  }

  Map<String, dynamic> toBookingCustomerMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'mobile': mobile,
      'email': email,
      'profileImage': profileImage,
      'pushToken': pushToken,
    };
  }

  Map<String, dynamic> toChatUserMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'profileImage': profileImage,
    };
  }
}
