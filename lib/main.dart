import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/pages/major/home_page.dart';
import 'package:wap_library/pages/detail/detail_page.dart';
import 'package:wap_library/pages/init/join_page.dart';
import 'package:wap_library/pages/init/login_page.dart';

import 'components/firestore_page.dart';

/*void main() {
  runApp(MyApp());
}*/
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), //여기다가 내가 가고싶은 페이지 이름 넣기
    );
  }
}


