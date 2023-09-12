import 'package:eyeme/pages/home.dart';
import 'package:eyeme/pages/login.dart';
import 'package:eyeme/pages/parents/Attendance_infor.dart';
import 'package:eyeme/pages/parents/notification.dart';
import 'package:eyeme/pages/parents/parents_profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
