import 'package:flutter/material.dart';
import 'package:proyectocorte3/src/pages/login.dart';
import 'package:proyectocorte3/src/pages/signup.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routes: {"/": (_) => Login(), "signup": (context) => signup()},
    );
  }
}
