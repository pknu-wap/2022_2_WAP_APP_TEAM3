// 둥근 텍스트 폼
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  static final TextInputFormatter digitsOnly =
  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));

  final String hint;
  final funValidator;

  const CustomTextFormField({required this.hint, required this.funValidator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: _Form(),
    );
  }

  Widget _Form() {
    return TextFormField(
      textAlignVertical: TextAlignVertical.bottom,
      obscureText: hint == "Password" ? true : false,
      validator: funValidator,
      keyboardType: hint == "Student Number"
          ? TextInputType.number
          : (hint == "Password"
          ? TextInputType.visiblePassword
          : (hint == "E-mail"
          ? TextInputType.emailAddress
          : TextInputType.phone)),
      inputFormatters: hint == "Student Number" || hint == "PhoneNumber"
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : <TextInputFormatter>[],
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        hintText: "$hint",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Color(0xff006285),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}