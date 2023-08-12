import 'dart:ui';
import 'package:flutter/material.dart';

import '../components/mybutton.dart';
import '../components/mytextfield.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final double _sigmaX = 5; // from 0-10
  final double _sigmaY = 5; // from 0-10
  final double _opacity = 0.2;
  final _formKey = GlobalKey<FormState>();

  // sign user in method
  void signUserIn() {
    if (_formKey.currentState!.validate()) {
      debugPrint('valid');
    } else {
      debugPrint('not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/page2.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                  const Text("Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  ClipRect(
                    child: BackdropFilter(
                      filter:
                          ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 0, 0, 1)
                              .withOpacity(_opacity),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                MyTextField(
                                  controller: usernameController,
                                  hintText: 'Email',
                                  obscureText: false,
                                  validateText: 'Enter your email',
                                ),
                                const SizedBox(height: 10),
                                MyPasswordTextField(
                                  controller: passwordController,
                                  hintText: 'Password',
                                  obscureText: true,
                                ),
                                const SizedBox(height: 30),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: '',
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                'By selecting Agree & Continue below, I agree to our ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                'Terms of Service and Privacy Policy',
                                            style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 71, 233, 133),
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    MyButtonAgree(
                                      text: "Agree and Continue",
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
