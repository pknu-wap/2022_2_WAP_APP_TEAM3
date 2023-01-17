import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../user/my_apply_page.dart';

///도서신청 페이지

class ApplyPage extends StatefulWidget {
  State<ApplyPage> createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  TextEditingController textarea_n = TextEditingController();
  TextEditingController textarea_w = TextEditingController();
  TextEditingController textarea_p = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _text = "";

  BookNameInputState() {
    textarea_n.addListener(() {
      setState(() {
        _text = textarea_n.text;
      });
    });
  }

  WriterNameInputState() {
    textarea_w.addListener(() {
      setState(() {
        _text = textarea_w.text;
      });
    });
  }

  PublisherNameInputState() {
    textarea_p.addListener(() {
      setState(() {
        _text = textarea_p.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40, left: 20.0, right: 20.0, bottom: 20.0),
              ),
              Container(
                width: 470,
                height: 60,
                padding: EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                decoration: BoxDecoration(
                  color: Color(0xff7AABBD),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 0,
                      blurRadius: 5.0,
                      offset: Offset(0, 10),
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    '희망 도서 신청하기',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Container(
                width: 500,
                padding: EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Color(0xff7AABBD)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    ///페이지 컨테이너 안 구성요소
                    children: [
                      BookNameInput(), //도서명 기입
                      WriterNameInput(), //저자명 기입
                      PublisherNameInput(), //출판사명 기입
                      ApplyButton(), //신청 버튼
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///책 이름 기입 위젯
  Widget BookNameInput() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextField(
        controller: textarea_n,
        onChanged: (bookname) {},
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          labelText: '도서명',
          helperText: '',
        ),
      ),
    );
  }

  ///저자명 기입 위젯
  Widget WriterNameInput() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextField(
        controller: textarea_w,
        onChanged: (bookname) {},
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          labelText: '저자명',
          helperText: '',
        ),
      ),
    );
  }

  ///출판사명 기입 위젯
  Widget PublisherNameInput() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextField(
        controller: textarea_p,
        onChanged: (bookname) {},
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          labelText: '출판사명',
          helperText: '',
        ),
      ),
    );
  }

  ///도서신청 버튼
  Widget ApplyButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.77,
      height: MediaQuery.of(context).size.height * 0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff7AABBD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),

        ///신청하기 버튼 누르면 뜨는 팝업
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
                      Text("도서 신청이 완료되었습니다."),
                      Container(
                        //텍스트 밑의 둥근모서리 박스
                        width: 210,
                        height: 210,
                        padding: EdgeInsets.all(15.0),
                        margin: const EdgeInsets.all(10.0),

                        decoration: BoxDecoration(
                          //컨테이너 데코레이션
                          border:
                              Border.all(width: 3, color: Color(0xff3B4C66)),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Column(
                          //둥근모서리 박스 안 구성요소
                          children: <Widget>[
                            ///버튼 두개
                            OutlinedButton(
                              // 버튼1
                              style: OutlinedButton.styleFrom(
                                fixedSize: const Size(180, 70),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {
                                  textarea_n.clear();
                                  textarea_p.clear();
                                  textarea_w.clear();
                                  _text = "";
                                });
                              },
                              child: Text('더 신청할 책이 있어요'),
                            ),
                            Container(
                              // 버튼 사이 여백
                              height: 25,
                              child: Text(''),
                            ),

                            OutlinedButton(
                              // 버튼2
                              style: OutlinedButton.styleFrom(
                                  fixedSize: Size(180, 70)),
                              onPressed: () {
                                Get.to(MyApplyPage());
                              },
                              child: const Text('나의 신청 내역 보러가기'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('취소'),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        child: const Text('신청하기'),
      ),
    );
  }
}
