import 'package:flutter/material.dart';
import 'package:libman/Components/model/user.dart';
import 'package:libman/screens/Welcome/welcome.dart';
import 'package:libman/services/authservice.dart';
import 'package:libman/screens/dashboard/dashboard.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authservice = Provider.of<Authservice>(context);
    return StreamBuilder<User?>(
      stream: authservice.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? WelcomeScreen() : Dashboard();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
