import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  final auth = FirebaseAuth.instance;
  final cloudFire = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
}
