// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

enum SpashServiceDb {
  APPSTART;

  Future<DocumentSnapshot<Map<String, dynamic>>> get refCol =>
      FirebaseFirestore.instance.collection(name).doc("APPSTATUS").get();
}
