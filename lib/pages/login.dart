import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'components/Logo.dart';
import 'components/customButton.dart';
import 'components/customField.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              // flex: 2,
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Logo(),
                const SizedBox(
                  height: 40,
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
                                  "Daily challenge the app help\nyou to get in "),
                          TextSpan(
                              text: "Success",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                        ]))
              ],
            ),
          )),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(90, 60),
                )),
            height: MediaQuery.of(context).size.height,
            child: ListView(
              controller: ScrollController(),
              children: [
                const Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
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
                              return "Email is no valid";
                            }
                          },
                          text: "Password",
                          controller: passController,
                          isPass: false,
                        ),
                        CustomButton(
                          pressed: () {
                            if (_formKey.currentState!.validate()) {
                              print("Hello Dave!");
                            }
                          },
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "Dosn't have and account\n",
                                  style: TextStyle(color: Colors.white)),
                              TextSpan(
                                  text: "Sign up?",
                                  style: TextStyle(color: Colors.purpleAccent),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {})
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
