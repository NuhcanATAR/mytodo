import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum TodoServiceDb {
  TODOS;

  CollectionReference<Map<String, dynamic>> get refMeetingCol =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("MEETINGS");

  CollectionReference<Map<String, dynamic>> get refGoingPlaceCol =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("PLACESTOGO");
}
