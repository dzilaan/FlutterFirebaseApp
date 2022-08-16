import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_firebase/Controller/login_controller.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      initState: maininit(),
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: controller.size.value.width * 0.9,
              child: Column(
                children: [
                  SizedBox(
                    height: controller.size.value.height * 0.15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: controller.size.value.width * 0.4,
                          child: Image.asset(
                            'assets/image/Logo.png',
                          )),
                    ],
                  ),
                  SizedBox(
                    height: controller.size.value.height * 0.06,
                  ),
                  const Text('Sign in'),
                  SizedBox(
                    height: controller.size.value.height * 0.04,
                  ),
                  TextFormField(
                    // controller: _controllerCust,
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
                    height: controller.size.value.height * 0.04,
                  ),
                  TextFormField(
                    // controller: _controllerCust,
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
                    height: controller.size.value.height * 0.07,
                  ),
                  Container(
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
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Color.fromARGB(255, 240, 134, 127),
                            blurRadius: 16.0,
                          ),
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Color.fromARGB(255, 238, 125, 117),
                            blurRadius: 16.0,
                          ),
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Color.fromARGB(255, 235, 108, 108),
                            blurRadius: 16.0,
                          ),
                        ]),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 18.0),
                    ),
                  ),
                  SizedBox(
                    height: controller.size.value.height * 0.06,
                  ),
                  Text(
                    'Forgot you Password?',
                    style: TextStyle(
                        fontSize: controller.size.value.width * 0.03,
                        foreground: Paint()
                          ..shader = ui.Gradient.linear(
                            const Offset(0, 40),
                            const Offset(150, 20),
                            <Color>[
                              const Color.fromARGB(255, 236, 136, 129),
                              Colors.red,
                            ],
                          )),
                  ),
                  SizedBox(
                    height: controller.size.value.height * 0.09,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have account? ',
                        style: TextStyle(
                          fontSize: controller.size.value.width * 0.04,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: controller.size.value.width * 0.04,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  maininit() {
    Get.put<LoginController>(LoginController());
  }
}
