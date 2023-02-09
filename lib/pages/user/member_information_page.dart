import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wap_library/components/custom_elevated_button.dart';
import 'package:wap_library/components/custom_text_form_field.dart';
import 'package:wap_library/util/vaildator_util.dart';

import '../major/my_page.dart';

///회원정보 수정 페이지
class MemberInformationPage extends StatefulWidget {
  const MemberInformationPage({Key? key}) : super(key: key);

  @override
  State<MemberInformationPage> createState() => _MemberInformationPageState();
}

///프로필 사진 widget >> onclick일 때 이미지 피커 수정
Widget Profile() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 30, bottom: 5),
        child: Stack(
          children: <Widget>[
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/113813770?s=96&v=4'),
            ),
          ],
        ),
      ),
    ],
  );
}

///정보 값 받는 위젯
Widget InfoForm() {
  return Column(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start, //왼쪽정렬
        children: [
          Text(
            '이름',
            style: TextStyle(fontSize: 15),
          ),
          Container(
            width: 300,
            padding: EdgeInsets.only(top: 7, bottom: 15),
            child:
                CustomTextFormField(hint: 'Name', funValidator: validateName()),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('이메일', style: TextStyle(fontSize: 15)),
          Container(
              width: 300,
              padding: EdgeInsets.only(top: 7, bottom: 15),
              child: CustomTextFormField(
                  hint: 'E-mail ex)wap@gmail.com',
                  funValidator: validateEmail())),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('전화번호', style: TextStyle(fontSize: 15)),
          Container(
              width: 300,
              padding: EdgeInsets.only(top: 7, bottom: 15),
              child: CustomTextFormField(
                  hint: 'Phone Number ex)01012341234',
                  funValidator: validatePhone())),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('비밀번호', style: TextStyle(fontSize: 15)),
          Container(
              width: 300,
              padding: EdgeInsets.only(top: 7, bottom: 40),
              child: CustomTextFormField(
                  hint: 'Passwords', funValidator: validatePassWord())),
        ],
      ),
    ],
  );
}

class _MemberInformationPageState extends State<MemberInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원정보 수정"),
        backgroundColor: Color(0xff2B4088),
      ),
      body: Container(
        color: Color(0xffF2F2F2),
        child: Column(
          children: [
            Container(
              child: Profile(),
            ),
            Container(
                padding: EdgeInsets.only(top: 33),
                child: InfoForm(),
                alignment: Alignment.center),
            Container(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff2B4088),
                      fixedSize: Size.fromWidth(300),
                      shape: StadiumBorder()),
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Icon(Icons.check_circle),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text("회원정보 수정이 완료되었습니다."),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: Color(0xff2B4088)),
                                onPressed: (){
                              Get.to(MyPage());
                            }, child: Text('확인'))
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text('확인')),
            ),
          ],
        ),
      ),
    );
  }
}
