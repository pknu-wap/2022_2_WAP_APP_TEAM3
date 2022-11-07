import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextArea extends StatelessWidget {

  final String hint;
  final funValidator;

  const CustomTextArea({required this.hint,required this.funValidator});

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(vertical: 5),
      child: _Form(),
    );
  }

  Widget _Form() {
    return TextFormField(
      maxLines: 20,
      validator: funValidator,
      decoration: InputDecoration(
        hintText: "Enter $hint",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}