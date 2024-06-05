import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task3/firebase_options.dart';
import 'package:task3/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}
