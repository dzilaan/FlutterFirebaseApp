import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_firebase/Controller/login_controller.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import 'login_form.dart';
import 'dart:ui' as ui;

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      initState: maininit(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: controller.size.value.width * 0.9,
                child: Column(
                  children: [
                    const LoginForm(),
                    SizedBox(
                      height: getSize(context).height * 0.06,
                    ),
                    Text(
                      'Forgot you Password?',
                      style: TextStyle(
                          fontSize: getSize(context).width * 0.03,
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
                      height: getSize(context).height * 0.09,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dont have account? ',
                          style: TextStyle(
                            fontSize: getSize(context).width * 0.04,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: getSize(context).width * 0.04,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  maininit() {
    Get.put<LoginController>(LoginController());
  }
}
