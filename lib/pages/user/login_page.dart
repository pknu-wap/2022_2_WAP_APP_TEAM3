import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wap_library/components/custom_text_form_feild.dart';
import 'package:wap_library/components/custom_elevated_button.dart';
import 'package:wap_library/pages/main/home_page.dart';
import 'package:wap_library/pages/user/join_page.dart';
import 'package:wap_library/util/vaildator_util.dart';
import 'package:wap_library/server/server.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: /*Padding(
        padding: const EdgeInsets.all(16.0),
        child: */ListView(
          children: [
            Container(
              color: Color(0xff006285),
              padding: EdgeInsets.only(top:80, bottom: 80),
              child: Image.asset(
                'assets/images/logo_w.png',
                width: 50,
                height: 50,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 50, bottom: 50),
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xff006285),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            /*Container(
              width: 10,
              child : Image(image: AssetImage("assets/images/logo.png"))
            ),*/
            _LoinForm(),
            Container(
              width: 250,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Get.to(JoinPage());
                },
                child: Text("SIGN UP", style: TextStyle(color: Color(0xff006285))),
              ),
            ),
          ],
        ),
      //),
    );
  }

  Widget _LoinForm() {
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
              text: "LOGIN", //로그인 버튼 size 변경 확인
              funPageRoute: () {
                if (_formKey.currentState!.validate()) {
                  Get.to(HomePage());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
