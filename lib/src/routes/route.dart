import 'package:flutter/material.dart';
import 'package:proyectocorte3/src/pages/login.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routes: {"/": (_) => const Login()},
    );
  }
}
