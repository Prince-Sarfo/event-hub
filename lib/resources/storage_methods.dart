// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class StorageMethods {
//   // instance of firebase storage
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // add  image to storage
//   Future<String> uploadImageToStorage(
//       String childName, Uint8List file, bool isPost) async {
//     Reference ref =
//         _storage.ref().child(childName).child(_auth.currentUser!.uid);

//     UploadTask uploadTask = ref.putData(file);

//     TaskSnapshot snap = await uploadTask.snapshot;
//     String downloadUrl = await snap.ref.getDownloadURL();
//     return downloadUrl;
//   }
// }
