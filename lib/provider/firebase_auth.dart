import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_challenge/pages/home.dart';
import 'package:daily_challenge/provider/navigate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Auth {
  final auth = FirebaseAuth.instance;
  final id = FirebaseAuth.instance.currentUser!.uid;
  Future<void> login(
    final formKey,
    TextEditingController emailController,
    TextEditingController passController,
    BuildContext context,
  ) async {
    if (formKey.currentState!.validate()) {
      try {
        await auth
            .signInWithEmailAndPassword(
                email: emailController.text, password: passController.text)
            .then((value) {
          CustomNavigate().nav(HomePage(), context);
        });
      } on FirebaseAuthException catch (e) {
        showsnackbar(e, context);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> signUp(
    final formKey,
    TextEditingController emailController,
    TextEditingController passController,
    BuildContext context,
    TextEditingController username,
  ) async {
    if (formKey.currentState!.validate()) {
      try {
        await auth
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passController.text)
            .then((value) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(emailController.text)
              .set({
            "username": username.text,
            "email": emailController.text,
            "passwd": passController.text
          });
        });
      } catch (e) {
        print("${e.toString()}");
      }
    }
  }

  showsnackbar(e, context) {
    final snackbar = SnackBar(
      content: Text("${e.message}"),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.redAccent,
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
