import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/pages/main/home_page.dart';
import 'package:wap_library/pages/user/join_page.dart';
import 'package:wap_library/pages/user/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

