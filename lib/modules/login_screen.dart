import 'package:algoriza_first_test/modules/register_screen.dart';
import 'package:algoriza_first_test/shared/component/widgets/social_media_button.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import '../shared/component/widgets/country_picker_widget.dart';
import '../shared/component/widgets/default_button_widget.dart';
import '../shared/component/widgets/default_text_button.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/img.jpeg')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
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
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                    key: formkey,
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
                      ],
                    )),
                DefaultButton(
                  text: 'sign in',
                  color: Colors.blue,
                  radius: 10,
                  onpressed: () {
                    formkey.currentState!.validate();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Expanded(
                      child: Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Text('Or'),
                    Expanded(
                        child: Divider(
                      indent: 10,
                      endIndent: 10,
                    ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SocialMediaButton(
                    text: 'sign with by google',
                    buttonType: SocialLoginButtonType.google),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't has any account"),
                    DefultTextButton(
                      text: "Register here",
                      widget: RegisterScreen(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'use the application according to policy rules. Any kinds of violations eill be subject to sanctions ',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
