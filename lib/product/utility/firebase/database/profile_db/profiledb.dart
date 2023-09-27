// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum ProfileDb {
  USERS;

  Future<DocumentSnapshot<Map<String, dynamic>>> get userRefCol =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();

  DocumentReference<Map<String, dynamic>> get userRefColTable =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseAuth.instance.currentUser?.uid);
}
