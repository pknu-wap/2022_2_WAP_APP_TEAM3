import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wap_library/components/custom_text_form_feild.dart';
import 'package:wap_library/components/custom_elevated_button.dart';
import 'package:wap_library/pages/user/login_page.dart';
import 'package:wap_library/util/vaildator_util.dart';

class JoinPage extends StatelessWidget {
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
                "회원가입 페이지",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _joinForm(),
            TextButton(
              onPressed: () {
                Get.to(LoginPage());
              },
              child: Text("ID가 존재하시나요?"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _joinForm() {
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
          CustomTextFormField(
            hint: "E-mail",
            funValidator: validateEmail(),
          ),
          CustomTextFormField(
            hint: "PhoneNumber",
            funValidator: validatePhone(),
          ),
          CustomElevatedButton(
            text: "승인요청",
            funPageRoute: () {
              if(_formKey.currentState!.validate()){
                Get.to(LoginPage());
              }
            },
          ),
        ],
      ),
    );
  }
}
