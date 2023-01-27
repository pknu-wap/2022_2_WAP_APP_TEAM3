import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wap_library/pages/init/login_page.dart';
import 'package:wap_library/pages/major/home_page.dart';

class SplashPage extends StatefulWidget {
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;
    print('[*] isLogin : ' + isLogin.toString());
    return isLogin;
  }

  void movePage() async {
    // async와 await : 비동기 구성
    // (checkLogin이 수행된 이후에 moveScreen을 수행해라)
    await checkLogin().then((isLogin) {
      //checkLogin : sharedpreferense와 연동되어 로그인 정보를 확인하는 함수
      if (isLogin) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      movePage();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(80),
          color: Color(0xff2D3C72),
            child: Image.asset(
              'assets/images/logo_w.png',
          ),
        ),
      ),
    );
  }
}
