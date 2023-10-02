import 'package:cloud_firestore/cloud_firestore.dart';

class PickupLocationModel {
  String? uid;
  String? address;
  bool? enabled;
  num? lat;
  num? lng;

// receiving data
  PickupLocationModel({
    this.uid,
    this.address,
    this.enabled,
    this.lat,
    this.lng,
  });

  factory PickupLocationModel.fromMap(map) {
    return PickupLocationModel(
      uid: map['uid'],
      address: map['address'],
      enabled: map['enabled'],
      lat: map['lat'],
      lng: map['lng'],
    );
  }

  PickupLocationModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    uid = documentSnapshot.id;
    address = documentSnapshot['address'];
    enabled = documentSnapshot['enabled'];
    lat = documentSnapshot['lat'];
    lng = documentSnapshot['lng'];
  }

// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'address': address,
      'enabled': enabled,
      'lat': lat,
      'lng': lng,
    };
  }
}
