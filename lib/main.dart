// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:ac_master/device.dart';
import 'package:ac_master/signin.dart';
import 'package:ac_master/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AcControllerApp());
}

class AcControllerApp extends StatelessWidget {
  const AcControllerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AC Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInPage(),
      routes: {
        '/Signup_page': (context) => const SignUpPage(),
        '/device': (context) => const DeviceListPage(),
      },
    );
  }
}
