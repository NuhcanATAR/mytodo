import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCalendarDb {
  CALENDAR;

  CollectionReference<Map<String, dynamic>> get calendarRef =>
      FirebaseFirestore.instance.collection(name);
}
