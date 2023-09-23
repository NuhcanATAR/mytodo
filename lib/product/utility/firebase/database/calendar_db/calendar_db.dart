import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCalendarDb {
  // ignore: constant_identifier_names
  CALENDAR;

  CollectionReference<Map<String, dynamic>> get calendarRef =>
      FirebaseFirestore.instance.collection(name);
}
