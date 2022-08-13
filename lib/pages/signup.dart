import 'package:daily_challenge/pages/components/Logo.dart';
import 'package:daily_challenge/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../provider/firebase_auth.dart';
import '../provider/navigate.dart';
import 'components/customButton.dart';
import 'components/customField.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();

  final auth = FirebaseAuth.instance;

  TextEditingController passController = TextEditingController();
  TextEditingController username = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Logo(),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "ubuntu",
                                fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      "Daily challenge the app that help\nyou to get "),
                              TextSpan(
                                  text: "Success in life",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ]))
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(90, 60),
                    )),
                child: ListView(
                  controller: ScrollController(),
                  children: [
                    const Text(
                      "Sign up",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomField(
                              controller: username,
                              text: "username",
                              isPass: false,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email is no valid";
                                }
                              },
                            ),
                            CustomField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email is no valid";
                                }
                              },
                              text: "Email",
                              controller: emailController,
                              isPass: false,
                            ),
                            CustomField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "password is no valid";
                                }
                              },
                              text: "Password",
                              controller: passController,
                              isPass: false,
                            ),
                            CustomButton(
                              text: "Sign Up",
                              pressed: () async {
                                Auth().signUp(_formKey, emailController,
                                    passController, context, username);
                              },
                            ),
                            RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: "Already have and account\n",
                                      style: TextStyle(color: Colors.white)),
                                  TextSpan(
                                      text: "Login?",
                                      style:
                                          TextStyle(color: Colors.purpleAccent),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          CustomNavigate()
                                              .nav(LoginPage(), context);
                                        })
                                ]))
                          ],
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
