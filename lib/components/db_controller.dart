import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/models/user_model.dart';

class DBController {
  Future<DocumentSnapshot> getUser(String userId) {
    return FirebaseFirestore.instance.collection("Users").doc(userId).get();
  }
}
