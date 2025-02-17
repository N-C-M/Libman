import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:libman/Components/authbutton.dart';
import 'package:libman/Components/background.dart';
import 'package:libman/constants.dart';
import 'package:libman/screens/Welcome/welcome.dart';
import 'package:libman/services/authservice.dart';
import 'package:libman/screens/dashboard/dashboard.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authservice = Provider.of<Authservice>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * .1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Libman",
                style: ktitleStyle,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: size.width * .06,
                    right: size.width * .06,
                    top: size.height * .1),
                child: Column(
                  children: [
                    Align(
                      child: Text(
                        "LogIn",
                        style: TextStyle(
                            fontSize: size.width * .07,
                            fontFamily: "RedHat",
                            color: Colors.black.withOpacity(.5)),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    TextField(
                      obscureText: true,
                      controller: password,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password_outlined),
                      ),
                    ),
                  ],
                ),
              ),
              AuthButton(
                size: size,
                label: "Log In",
                onPress: () async {
                  print("Login Screen");
                  print(email.text);
                  print(password.text);
                  await authservice.SignInWithEmailandPassword(
                      email.text, password.text);
                  Navigator.of(context).pop();
                  //Dashboard();
                  //Navigator.push(context,
                  //   MaterialPageRoute(builder: (context) => Dashboard()));
                },
                // onpress: Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => WelcomeScreen())),
              )
            ],
          ),
        ),
      ),
    );
  }
}
