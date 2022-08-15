import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddFiles {
  final userFile = FirebaseFirestore.instance.collection('user-file');
  final id = FirebaseAuth.instance.currentUser!.email;
  List hobbi = [];
  checkFile() async {
    DocumentSnapshot snapshot = await userFile.doc(id).get();
    var data = snapshot.data() as Map;
    var hobbies = data['user-hobbies'] as List<dynamic>;
    return (hobbies.isNotEmpty);
  }

  addFile(String value, context) async {
    DocumentSnapshot snapshot = await userFile.doc(id).get();
    var data = snapshot.data() as Map;
    var hobbies = data['user-hobbies'] as List<dynamic>;
    if (hobbies.contains(value)) {
      showsnack("Already in the list", context);
      return;
    } else {
      hobbies.add(value);
      try {
        userFile.doc(id).update({
          "user-hobbies": hobbies,
        });
      } catch (e) {
        print("$e");
      }
    }
  }

  deleteFile(String value, context) async {
    DocumentSnapshot snapshot = await userFile.doc(id).get();
    var data = snapshot.data() as Map;
    var hobbies = data['user-hobbies'] as List<dynamic>;
    if (!hobbies.contains(value)) {
      showsnack("Already Deleted", context);
    } else {
      hobbies.remove(value);
      try {
        userFile.doc(id).update({
          "user-hobbies": hobbies,
        });
      } catch (e) {
        print("$e");
      }
    }
  }

  showsnack(e, context) {
    final snackbar = SnackBar(
      content: Text(e),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.redAccent,
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
