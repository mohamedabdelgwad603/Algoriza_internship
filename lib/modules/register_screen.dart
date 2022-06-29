import 'dart:ui';

import 'package:algoriza_first_test/modules/login_screen.dart';
import 'package:algoriza_first_test/shared/component/widgets/country_picker_widget.dart';
import 'package:algoriza_first_test/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../shared/component/components.dart';
import '../shared/component/widgets/default_button_widget.dart';
import '../shared/component/widgets/textform_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
                width: double.infinity,
                height: height * .15,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/img.jpeg')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "welcome to fashion Daily",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Reigster",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const Text(
                        "Help",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                      IconButton(
                          icon: const Icon(
                            Icons.help,
                            color: Colors.blue,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                  Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const TextFormWidget(
                        hint: 'Email',
                        type: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "phone number",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CountryPickerWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "password",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const TextFormWidget(
                        hint: 'password',
                        type: TextInputType.visiblePassword,
                        isPassword: true,
                        suffix: Icons.visibility,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DefaultButton(
                        text: 'Register',
                        color: Colors.blue,
                        radius: 10,
                        onpressed: () {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DefaultButton(
                        text: 'sign with by google',
                        textColor: Colors.blue,
                        color: Colors.white,
                        isBorder: true,
                        radius: 10,
                        onpressed: () {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Have any account"),
                          TextButton(
                              onPressed: () {
                                push(context, const LoginScreen());
                              },
                              child: const Text(
                                "sign in here",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
