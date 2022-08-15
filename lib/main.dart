import 'package:daily_challenge/pages/home.dart';
import 'package:daily_challenge/provider/firebase_addFile.dart';
import 'package:daily_challenge/provider/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      theme: ThemeData(
        fontFamily: "ubuntu",
      ),
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser?.uid == null
          ? LoginPage()
          : HomePage()));
}
