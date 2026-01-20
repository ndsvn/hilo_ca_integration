// import 'dart:developer';
//
// import 'package:firebase_database/firebase_database.dart';
//
// import 'firebase_src.dart';
//
// class FirebaseDataBaseApp {
//   static firebaseRef() => FirebaseDatabase.instance.ref().child(
//       FirebaseInit().userCredential?.user?.uid ??
//           'ftU2koADJrUyoTujVITbR93VByg1');
//   static firebaseRefConfig() => firebaseRef().child('prod');
//
//   static Future<FirebaseDbConfigModel?> getFirebaseDbConfigModel() async {
//     DatabaseEvent databaseEvent = await firebaseRefConfig().once();
//     if (databaseEvent.snapshot.value != null) {
//       final data = (databaseEvent.snapshot.value as Map).values;
//       if (data.isNotEmpty) {
//         return FirebaseDbConfigModel.fromJson(Map.from(data.first));
//       }
//     }
//     return null;
//   }
//
//   static Future<void> addFirebaseDbConfigModel() async {
//     try {
//       await firebaseRefConfig()
//           .child('firebaseDbConfigModel')
//           .set(FirebaseDbConfigModel(
//             phoneSupportApp: '19003369',
//             zaloLink: '',
//             fbLink: '',
//             errorNote: '',
//             isShowErrorNote: false,
//             isUpdateNoteImportant: false,
//             updateNoteImportant: '',
//             minAndroidVersion: '1.0.0',
//             minIosVersion: '1.0.0',
//           ).toJson());
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }
