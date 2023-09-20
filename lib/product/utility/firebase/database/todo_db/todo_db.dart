import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum TodoServiceDb {
  TODOS;

  // collection ref
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

  CollectionReference<Map<String, dynamic>> get refStudyPlaceCol =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("STUDYS");

  CollectionReference<Map<String, dynamic>> get refBooksPlaceCol =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("BOOKS");

  CollectionReference<Map<String, dynamic>> get refShoppingPlaceCol =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("SHOPPINGLIST");

  CollectionReference<Map<String, dynamic>> get refHealtPlaceCol =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("HEALTHLISTS");

  CollectionReference<Map<String, dynamic>> get refSporPlaceCol =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("SPORTSPLAN");

  CollectionReference<Map<String, dynamic>> get refMoviePlaceCol =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("MOVIELIST");

  // query snapshot

  Stream<QuerySnapshot> get stTodoMeetingCol => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("MEETINGS")
      .snapshots();

  Stream<QuerySnapshot> get stTodoBooksCol => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("BOOKS")
      .snapshots();

  Stream<QuerySnapshot> get stTodoShoppingCol => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("SHOPPINGLIST")
      .snapshots();

  Stream<QuerySnapshot> get stTodoSportCol => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("SPORTSPLAN")
      .snapshots();

  Stream<QuerySnapshot> get stTodoStudyCol => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("STUDYS")
      .snapshots();

  Stream<QuerySnapshot> get stTodoHealthCol => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("HEALTHLISTS")
      .snapshots();

  Stream<QuerySnapshot> get stTodoMovieCol => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("MOVIELIST")
      .snapshots();

  Stream<QuerySnapshot> get stTodoPlacesToGoCol => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("PLACESTOGO")
      .snapshots();

  Stream<QuerySnapshot> get stTodoShopCol => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("SHOPPINGLIST")
      .snapshots();

  Stream<QuerySnapshot> get stTodoTestCol => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("TEST")
      .snapshots();
}
