import 'package:flutter/material.dart';
import 'package:proyectocorte3/src/routes/route.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const RoutePage());
}
