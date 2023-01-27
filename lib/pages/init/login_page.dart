import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wap_library/components/custom_text_form_field.dart';
import 'package:wap_library/components/custom_elevated_button.dart';
import 'package:wap_library/pages/major/home_page.dart';
import 'package:wap_library/pages/init/join_page.dart';
import 'package:wap_library/util/vaildator_util.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  Future setLogin() async {
    //setLogin이라는 함수 : SharedPreferences.getInstance()가 수행된 이후에 실행됨. isLogin 값을 true로 바꾸어 줌.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            Container(
              color: Color(0xff006285),
              padding: EdgeInsets.only(top: 200, bottom: 50),
              child: Image.asset(
                'assets/images/logo_w.png',
                width: 90,
                height: 90,
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 50, bottom: 0),
              height: MediaQuery.of(context).size.height,
              child: _LoginForm(),
            ),
          ],
        ),
    );
  }

  Widget _LoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            width: 300,
            child: CustomTextFormField(
              hint: "Student Number", //텍스트 정렬 center
              funValidator: validateStudentNumber(),
            ),
          ),
          Container(
            width: 300,
            child: CustomTextFormField(
              hint: "Password",
              funValidator: validatePassWord(),
            ),
          ),
          Container(
            width: 300,
            height: 40,
            margin: EdgeInsets.only(top: 30),
            child: CustomElevatedButton(
              text: "LOGIN",
              funPageRoute: () {
                if (_formKey.currentState!.validate()) {
                  Get.to(HomePage());
                }
                ;
                setLogin();
              },
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 250,
            height: 40,
            color: Colors.white,
            child: TextButton(
              onPressed: () {
                Get.to(JoinPage());
              },
              child:
              Text("SIGN UP", style: TextStyle(color: Color(0xff006285))),
            ),
          ),
        ],
      ),
    );
  }
}
