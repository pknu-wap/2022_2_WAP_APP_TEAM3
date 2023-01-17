import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wap_library/components/custom_text_form_field.dart';
import 'package:wap_library/components/custom_elevated_button.dart';
import 'package:wap_library/pages/init/login_page.dart';
import 'package:wap_library/util/vaildator_util.dart';

class JoinPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Color(0xff006285),
            padding: EdgeInsets.only(top: 50, bottom: 40),
            child: Image.asset(
              'assets/images/logo_w.png',
              width: 90,
              height: 90,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "SIGN UP", // 해당페이지 제목
              style: TextStyle(
                color: Color(0xff006285),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(margin: EdgeInsets.only(top: 20), child: _joinForm()),
          TextButton(
            onPressed: () {
              Get.to(LoginPage());
            },
            child: Text(
              "Do you have ID?",
              style: TextStyle(
                color: Color(0xff006285),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _joinForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            width: 300,
            child: CustomTextFormField(
              hint: "학번",
              funValidator: validateStudentNumber(),
            ),
          ),
          Container(
            width: 300,
            child: CustomTextFormField(
              hint: "이름",
              funValidator: validateName(),
            ),
          ),
          Container(
            width: 300,
            child: CustomTextFormField(
              hint: "비밀번호",
              funValidator: validatePassWord(),
            ),
          ),
          Container(
            width: 300,
            child: CustomTextFormField(
              hint: "이메일 주소",
              funValidator: validateEmail(),
            ),
          ),
          Container(
            width: 300,
            child: CustomTextFormField(
              hint: "휴대전화 번호",
              funValidator: validatePhone(),
            ),
          ),
          Container(
            width: 300,
            height: 40,
            margin: EdgeInsets.only(top: 20),
            child: CustomElevatedButton(
              text: "가입하기",
              funPageRoute: () {
                if (_formKey.currentState!.validate()) {
                  Get.to(LoginPage());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
