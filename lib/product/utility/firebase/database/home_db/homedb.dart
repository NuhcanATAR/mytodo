import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum HomeServiceDb {
  USERS,
  CATEGORYS,
  NOTES;

  Future<DocumentSnapshot<Map<String, dynamic>>> get refCol =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

  Stream<QuerySnapshot<Map<String, dynamic>>> get refTodoCategoryCol =>
      FirebaseFirestore.instance
          .collection(name)
          .doc("TODOCATEGORYS")
          .collection("CATEGORYS")
          .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> get refStreamListCol =>
      FirebaseFirestore.instance.collection(name).snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> get refNoteStreamListCol =>
      FirebaseFirestore.instance
          .collection(name)
          .where("USERID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .orderBy('DATE', descending: true)
          .snapshots();

  CollectionReference<Map<String, dynamic>> get refAddCol =>
      FirebaseFirestore.instance.collection(name);

  CollectionReference<Map<String, dynamic>> get refDeleteCol =>
      FirebaseFirestore.instance.collection(name);
}
