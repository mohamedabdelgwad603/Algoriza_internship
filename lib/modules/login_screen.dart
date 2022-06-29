import 'package:algoriza_first_test/modules/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../shared/component/components.dart';
import '../shared/component/widgets/country_picker_widget.dart';
import '../shared/component/widgets/default_button_widget.dart';
import '../shared/component/widgets/textform_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                height: height * .3,
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
                        "sign in",
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
                        "phone number",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CountryPickerWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultButton(
                        text: 'sign in',
                        color: Colors.blue,
                        radius: 10,
                        onpressed: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultButton(
                        text: 'sign with by google',
                        textColor: Colors.blue,
                        color: Colors.white,
                        isBorder: true,
                        radius: 10,
                        onpressed: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't has any account"),
                          TextButton(
                              onPressed: () {
                                push(context, const RegisterScreen());
                              },
                              child: const Text(
                                "Register here",
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
