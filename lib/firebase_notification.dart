// import 'package:dio/dio.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:googleapis_auth/auth_io.dart' as auth;
// import 'package:http/http.dart' as http;
// import 'package:sadio_mane_store/app/env_variable.dart';

// class NotificationsHelper {
//   // creat instance of fbm
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   // initialize notifications for this app or device
//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     // get device token
//     String? deviceToken = await _firebaseMessaging.getToken();
//     // DeviceToken = deviceToken;
//     print(
//       '===================Device FirebaseMessaging Token====================',
//     );
//     print(deviceToken);
//     print(
//       '===================Device FirebaseMessaging Token====================',
//     );
//   }

//   // handle notifications when received
//   void handleMessages(RemoteMessage? message) {
//     if (message != null) {
//       // navigatorKey.currentState?.pushNamed(NotificationsScreen.routeName, arguments: message);
//     }
//   }

//   // handel notifications in case app is terminated
//   Future<void> handleBackgroundNotifications() async {
//     await FirebaseMessaging.instance.getInitialMessage().then(handleMessages);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
//   }

//   Future<String?> getAccessToken() async {
//     final serviceAccountJson = EnvVariable.getInstance.getServiceAccountJson();

//     final List<String> scopes = [
//       'https://www.googleapis.com/auth/userinfo.email',
//       'https://www.googleapis.com/auth/firebase.database',
//       'https://www.googleapis.com/auth/firebase.messaging',
//     ];

//     try {
//       http.Client client = await auth.clientViaServiceAccount(
//         auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
//         scopes,
//       );

//       auth.AccessCredentials credentials = await auth
//           .obtainAccessCredentialsViaServiceAccount(
//             auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
//             scopes,
//             client,
//           );

//       client.close();
//       print(
//         'Access Token: ${credentials.accessToken.data}',
//       ); // Print Access Token
//       return credentials.accessToken.data;
//     } catch (e) {
//       print('Error getting access token: $e');
//       return null;
//     }
//   }
// }
