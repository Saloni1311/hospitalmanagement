import 'package:flutter/material.dart';
import 'login/login.dart';
import 'login/otp_page.dart';


void main() {
  runApp(HospitalManagementApp());
}

class HospitalManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOGIN',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
