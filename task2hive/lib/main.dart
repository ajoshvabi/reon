import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task2hive/box.dart';
import 'package:task2hive/cartmodel.dart';
import 'package:task2hive/pages/splash.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CartmodelAdapter());

  cartBox = await Hive.openBox<Cartmodel>('cartBox');
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Splash()));
}
