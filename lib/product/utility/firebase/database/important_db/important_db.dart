// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum ImportantServiceDb {
  IMPORTANT;

  Future<DocumentSnapshot<Map<String, dynamic>>> get refCol =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

  Stream<QuerySnapshot> get stImportantyCol => FirebaseFirestore.instance
      .collection(name)
      .where("USERID", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
      .snapshots();
}
