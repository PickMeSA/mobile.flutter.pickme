import 'dart:convert';

import 'package:http/http.dart' as http;

import '../components/service_constants.dart';

Future<void> sendNotificationToPlayer(
  String playerId,
  String title,
  String content,
) async {
  var url = 'https://onesignal.com/api/v1/notifications';
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Basic <YOUR_REST_API_KEY>',
  };

  var payload = {
    'app_id': oneSignalId,
    'include_player_ids': [playerId],
    'contents': {'en': content},
    'headings': {'en': title},
  };

  var response = await http.post(Uri.parse(url),
      headers: headers, body: jsonEncode(payload));

  if (response.statusCode == 200) {
    print('Notification sent successfully');
  } else {
    print('Failed to send notification. Error code: ${response.statusCode}');
  }
}




// import 'dart:convert';
// import 'dart:developer';
// import 'package:app/components/service_constants.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// import 'package:app/main.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'package:http/http.dart' as http;

// import '../screens/bookings/booking_requests.dart';

// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   handleMessage(message);
// }

// void handleMessage(RemoteMessage? message) {
//   if (message != null) return;
// }

// Future initPushNotification() async {
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );

//   FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//   FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   FirebaseMessaging.onMessage.listen((message) {
//     final notification = message.notification;
//     if (notification == null) return;
//   });
// }

// class FirebaseApi {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   final _androidChannel = const AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     description:
//         'This channel is used for important notifications.', // description
//     importance: Importance.defaultImportance,
//   );
//   final _localNotifications = FlutterLocalNotificationsPlugin();

//   Future<void> initNotification() async {
//     NotificationSettings settings = await _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: true,
//       provisional: false,
//       sound: true,
//     );
//     final fCMToken = await _firebaseMessaging.getToken();
//     log("TOKEN: $fCMToken");
//     if (fCMToken != null) {
//       try {
//         await FirebaseFirestore.instance
//             .collection("Users")
//             .doc(FirebaseAuth.instance.currentUser!.uid)
//             .update({
//           'pushToken': fCMToken,
//         });
//         log('USER UPDATED');
//       } catch (e) {
//         log(e.toString());
//         log('USER NOT UPDATED');
//       }
//     }
//     initPushNotification();
//   }
// }

// void sendPushMessage(
//   String token,
//   String body,
//   String title,
// ) async {
//   try {
//     FirebaseMessaging.instance.sendMessage(
//       to: token,
//       data: {
//         'title': 'Hello',
//         'body': 'This is a test notification from Flutter',
//       },
//     );
//   } catch (e) {
//     log("123123: ${e.toString()}");
//   }
// }