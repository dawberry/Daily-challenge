import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../provider/firebase_addFile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userFile = FirebaseFirestore.instance.collection('user-file');
  final id = FirebaseAuth.instance.currentUser!.email;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30))),
            child: const Text(
              "Home",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("quotes")
                    .doc("quotes")
                    .snapshots(),
                builder: (context, snapshot) {
                  Map data = (snapshot.data?.data() ?? {}) as Map;
                  int rand = Random().nextInt(99);
                  return CarouselSlider.builder(
                      itemCount: 3,
                      itemBuilder: (context, index, i) {
                        switch (index) {
                          case 0:
                            rand = Random().nextInt(99);
                            break;
                          case 1:
                            rand = Random().nextInt(99);
                            break;
                          case 2:
                            rand = Random().nextInt(99);
                            break;
                        }
                        return GestureDetector(
                          onTapDown: (value) {},
                          child: Container(
                              margin: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange[100],
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "${data['quote'][rand]}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              )),
                        );
                      },
                      options: CarouselOptions());
                },
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                height: 200,
              )),
        ]),
      ),
    );
  }
}
