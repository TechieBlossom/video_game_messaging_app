import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {

  Stream<QuerySnapshot> getList(String type) {
    return Firestore.instance.collection(type.toLowerCase()).snapshots();
  }
}