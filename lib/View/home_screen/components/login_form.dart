import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_firebase/View/main_screen.dart/main_screen.dart';

import 'package:flutter_ecommerce_app_firebase/constants.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

var _forgotKey = GlobalKey<FormState>();
bool isLogin = true;
TextEditingController email = TextEditingController();
TextEditingController pass = TextEditingController();

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _forgotKey,
      child: Column(
        children: [
          SizedBox(
            height: getSize(context).height * 0.15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: getSize(context).width * 0.4,
                  child: Image.asset(
                    'assets/image/Logo.png',
                  )),
            ],
          ),
          SizedBox(
            height: getSize(context).height * 0.06,
          ),
          const Text('Sign in'),
          SizedBox(
            height: getSize(context).height * 0.04,
          ),
          TextFormField(
            controller: email,
            validator: (value) {
              if (value!.isEmpty) {
                return "Fill in email field";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: "Username",
              hintText: "Enter Username",
              labelStyle: TextStyle(color: Colors.black),
              hintStyle: TextStyle(color: Colors.black),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: getSize(context).height * 0.04,
          ),
          TextFormField(
            controller: pass,
            validator: (value) {
              if (value!.isEmpty) {
                return "Fill in password field";
              } else {
                return null;
              }
            },
            decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Enter Password",
              labelStyle: TextStyle(color: Colors.black),
              hintStyle: TextStyle(color: Colors.black),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(
                Icons.lock_open_rounded,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: getSize(context).height * 0.07,
          ),
          GestureDetector(
            onTap: (() async {
              if (_forgotKey.currentState!.validate()) {
                showDialog(
                    context: context,
                    builder: (builder) {
                      return SizedBox(
                        width: getSize(context).width * 0.002,
                        child: const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      );
                    });
                setState(() {
                  isLogin = false;
                });
                await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email.text, password: pass.text)
                    .then((value) {
                  Navigator.pop(context);
                  Get.to(const MainScreen());
                }).catchError((error) {
                  debugPrint('LOGIN ERROR: ${error.message}');
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return AlertDialog(
                          content: Text('LOGIN ERROR: ${error.message}'),
                        );
                      });
                  setState(() {
                    isLogin = true;
                  });
                  Navigator.pop(context);
                });
              }
            }),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              alignment: Alignment.center,
              width: double.infinity,
              height: 50.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 240, 134, 127),
                  Colors.red,
                ]),
                // boxShadow: [
                //   BoxShadow(
                //     offset: Offset(0, 0),
                //     color: Color.fromARGB(255, 240, 134, 127),
                //     blurRadius: 16.0,
                //   ),
                //   BoxShadow(
                //     offset: Offset(0, 0),
                //     color: Color.fromARGB(255, 238, 125, 117),
                //     blurRadius: 16.0,
                //   ),
                //   BoxShadow(
                //     offset: Offset(0, 0),
                //     color: Color.fromARGB(255, 235, 108, 108),
                //     blurRadius: 16.0,
                //   ),
                // ],
              ),
              child: const Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
