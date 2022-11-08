import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wap_library/components/custom_text_form_feild.dart';
import 'package:wap_library/components/custom_elevated_button.dart';
import 'package:wap_library/pages/main/home_page.dart';
import 'package:wap_library/pages/user/join_page.dart';
import 'package:wap_library/util/vaildator_util.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            _LoinForm(),
            Container(
              width : 250,
              height : 40,
              child :TextButton(
                onPressed: () {
                  Get.to(JoinPage());
                },
                child: Text("SIGN UP"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _LoinForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            width: 300,
            child : CustomTextFormField(
              hint: "Student Number", //텍스트 정렬 center
              funValidator: validateStudentNumber(),
            ),
          ),
          Container(
            width : 300,
            child : CustomTextFormField(
              hint: "Password",
              funValidator: validatePassWord(),
            ),
          ),
          Container(
            width : 300,
            height : 40,
            margin : EdgeInsets.only(top:20),
            child : CustomElevatedButton(
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
