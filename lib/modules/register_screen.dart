import 'package:algoriza_first_test/modules/login_screen.dart';
import 'package:algoriza_first_test/shared/component/widgets/country_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import '../shared/component/widgets/default_button_widget.dart';
import '../shared/component/widgets/default_text_button.dart';
import '../shared/component/widgets/social_media_button.dart';
import '../shared/component/widgets/textform_widget.dart';

class RegisterScreen extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
                width: double.infinity,
                height: height * .10,
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
                      key: formkey,
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
                          TextFormWidget(
                            hint: 'Email',
                            type: TextInputType.emailAddress,
                            validate: (val) {
                              if (val!.isEmpty)
                                return "email must not be empty";
                              return null;
                            },
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
                          TextFormWidget(
                            hint: 'password',
                            type: TextInputType.visiblePassword,
                            isPassword: true,
                            suffix: Icons.visibility,
                            validate: (val) {
                              if (val!.isEmpty)
                                return "password must not be empty";
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
                  DefaultButton(
                    text: 'Register',
                    color: Colors.blue,
                    radius: 10,
                    onpressed: () {
                      formkey.currentState!.validate();
                    },
                  ),
                  const SizedBox(
                    height: 10,
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
                    height: 10,
                  ),
                  const SocialMediaButton(
                      text: 'sign with by google',
                      buttonType: SocialLoginButtonType.google),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have any account"),
                      DefultTextButton(
                        text: "sign in here",
                        widget: LoginScreen(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'By registering your account, you agree to our ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text('terms and condition ',
                            style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
