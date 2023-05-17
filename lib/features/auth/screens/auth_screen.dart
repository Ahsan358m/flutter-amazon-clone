import 'package:flutter/material.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../constants/global_variables.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final signUpFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailControllerSignUp = TextEditingController();
  final TextEditingController _passwordControllerSignUp =
      TextEditingController();
  final TextEditingController _emailControllerSignIn = TextEditingController();
  final TextEditingController _passwordControllerSignIn =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _emailControllerSignUp.dispose();
    _passwordControllerSignUp.dispose();
    _nameController.dispose();
    _emailControllerSignIn.dispose();
    _passwordControllerSignIn.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: Text(
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
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
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: EdgeInsets.all(10),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: signUpFormKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          obsecureText: false,
                          controller: _nameController,
                          hintText: "Name",
                          label: "Name",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          obsecureText: false,
                          controller: _emailControllerSignUp,
                          hintText: "Email",
                          label: "Email",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          obsecureText: true,
                          controller: _passwordControllerSignUp,
                          hintText: "Password",
                          label: "Password",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          onTap: () {},
                          text: "Sign-Up",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: Text(
                  "Sign-in Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
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
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: EdgeInsets.all(10),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: signUpFormKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          obsecureText: false,
                          controller: _emailControllerSignIn,
                          hintText: "Email",
                          label: "Email",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          obsecureText: true,
                          controller: _passwordControllerSignIn,
                          hintText: "Password",
                          label: "Password",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          onTap: () {},
                          text: "Sign-In",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
