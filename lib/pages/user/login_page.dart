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
                "로그인 페이지",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _LoinForm(),
            TextButton(
              onPressed: () {
                Get.to(JoinPage());
              },
              child: Text("회원가입"),
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
          CustomTextFormField(
            hint: "Student Number",
            funValidator: validateStudentNumber(),
          ),
          CustomTextFormField(
            hint: "Password",
            funValidator: validatePassWord(),
          ),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () {
              if (_formKey.currentState!.validate()) {
                Get.to(HomePage());
              }
            },
          ),
        ],
      ),
    );
  }
}
