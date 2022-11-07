import 'package:flutter/material.dart';
import 'package:wap_library/components/custom_text_form_feild.dart';
import 'package:wap_library/components/custom_textarea.dart';
import 'package:wap_library/util/vaildator_util.dart';

class AddPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CustomTextFormField(hint:"Title", funValidator: validateTitle(),),
            CustomTextArea(hint: "Content", funValidator: validateContents(),),
          ],
        ),
      ),
    );
  }
}