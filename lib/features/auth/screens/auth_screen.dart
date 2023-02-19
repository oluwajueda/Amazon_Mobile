// ignore_for_file: prefer_const_constructors

import 'package:amazon_mobile/common/widgets/custom_button.dart';
import 'package:amazon_mobile/common/widgets/custom_textfield.dart';
import 'package:amazon_mobile/constants/global_variables.dart';
import 'package:amazon_mobile/features/auth/screens/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signup,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            hintText: "Name",
                            controller: _nameController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            hintText: "Email",
                            controller: _emailController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            hintText: "Password",
                            controller: _passwordController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                              text: "Sign Up",
                              onTap: () {
                                if (_signUpFormKey.currentState!.validate()) {
                                  signUpUser();
                                }
                              })
                        ],
                      )),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  "Sign-In.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            hintText: "Email",
                            controller: _emailController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            hintText: "Password",
                            controller: _passwordController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(text: "Sign In ", onTap: () {})
                        ],
                      )),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
