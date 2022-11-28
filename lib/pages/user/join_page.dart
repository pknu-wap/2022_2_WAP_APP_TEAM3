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
              margin: EdgeInsets.only(top:60),
              child: Text(
                "SIGN UP", // 해당페이지 제목
                style: TextStyle(
                  color: Color(0xff667eea),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top:40),
                child : _joinForm()
            ),
            TextButton(
              onPressed: () {
                Get.to(LoginPage());
              },
              child: Text("Do you have ID?",style: TextStyle(color : Color(0xff667eea),),),
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
          Container(
            width : 300,
            child : CustomTextFormField(
              hint: "Student Number",
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
            width: 300,
            child : CustomTextFormField(
              hint: "E-mail",
              funValidator: validateEmail(),
            ),
          ),
          Container(
            width: 300,
            child : CustomTextFormField(
              hint: "Phone Number",
              funValidator: validatePhone(),
            ),
          ),
          Container(
            width: 300,
            height: 40,
            margin : EdgeInsets.only(top:20),
            child: CustomElevatedButton(
              text: "Approval",
              funPageRoute: () {
                if(_formKey.currentState!.validate()){
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