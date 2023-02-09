import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wap_library/components/custom_text_form_field.dart';
import 'package:wap_library/components/custom_textarea.dart';
import 'package:wap_library/util/vaildator_util.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/camera.dart';

/*
해야할 것
1. 코드 단축 (textfield 하나만 써서 정리하기) >>> clear!
2. 팝업창을 camera page에 만들기 (camera page에서 완료를 누르면 add page로 사진 데이터 전송되게 하기)
3. 분류 고를 수 있게 하기
*/

///도서 추가페이지
class AddPage extends StatelessWidget {
  const AddPage({super.key});

  PreferredSizeWidget CustomAppbar( ) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0), // here the desired height
      child: AppBar(
        backgroundColor: Color(0xff2D3C72),
        title: Container(
          padding: EdgeInsets.only(top: 20, left: 10),
          child: Text(
            "관리자 _ 도서추가 페이지",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 25),
                  child: Text(
                    '추가할 도서 정보를 입력해주세요',
                    style: TextStyle(
                      color: Color(0xff2D3C72),
                      fontSize: 20,
                    ),
                  ),
                ),
                AddTextfield(labelText: '분류', hintText : '분류를 선택하세요.'),
                SizedBox(
                  height: 20.0,
                ),
                AddTextfield(labelText: '도서명', hintText : '도서명을 입력하세요.'),
                SizedBox(
                  height: 20.0,
                ),
                AddTextfield(labelText: '저자명', hintText : '저자명을 입력하세요.'),
                SizedBox(
                  height: 20.0,
                ),
                AddTextfield(labelText: '출판사명', hintText : '출판사명을 입력하세요.'),
                SizedBox(
                  height: 20.0,
                ),
                AddTextfield(labelText: '청구기호', hintText : '청구기호를 입력하세요.'),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Color(0xffD6D6D6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                //컨테이너 데코레이션
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.wallpaper,
                                    size: 40,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "이미지 업로드",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                          onTap: () {}),
                      Container(width: 10, height: 10, color: Colors.pink),
                    ],
                  ),
                ),
                AddButton(),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class AddTextfield extends StatelessWidget {
  final String labelText;
  final String hintText;

  AddTextfield({required this.labelText, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          // 텍스트필드 선택했을 때
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide:
          BorderSide(width: 1, color: Color(0xff2D3C72)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        contentPadding:
        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
    );
  }
}



class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Color(0xff2D3C72),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: const Text(
            '도서 신청 완료하기',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Container(
                  padding:
                  EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
                  child: Text("도서 추가가\n완료되었습니다.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2D3C72),
                    ),),
                ),
                actions: [
                  TextButton(
                      onPressed: () {Navigator.pop(context);},
                      child: Text("확인"))
                ],
              );
            });
      },
    );
  }
}
