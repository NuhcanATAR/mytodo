// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

enum RegisterServiceDb {
  USERS;

  CollectionReference<Map<String, dynamic>> get refCol =>
      FirebaseFirestore.instance.collection(name);
}
