import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../user/my_apply_page.dart';
import 'package:wap_library/pages/major/home_page.dart';

///도서신청 페이지

class ApplyPage extends StatefulWidget {
  State<ApplyPage> createState() => _ApplyPageState(appBarTitle: 'ApplyPage~');
}

class _ApplyPageState extends State<ApplyPage> {
  final String appBarTitle;
  _ApplyPageState({required this.appBarTitle});

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
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    '도서 신청을 위한 양식을 입력해 주세요.',
                    style: TextStyle(
                      color: Color(0xff2D3C72),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    ///도서신청 양식 기입 박스
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1.5, color: Colors.black38),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 0,
                          blurRadius: 5.0,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              '도서1',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          BookNameInput(), //도서명 기입
                          WriterNameInput(), //저자명 기입
                          PublisherNameInput(), //출판사명 기입
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                MoreApplyButton(),
                //Spacer(), // 이 아래 위젯을 가장 아래에 고정시키는 위젯
                ApplyButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  //책 이름 기입 위젯
  Widget BookNameInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
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

  //저자명 기입 위젯
  Widget WriterNameInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
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

  //출판사명 기입 위젯
  Widget PublisherNameInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
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

  /// 도서추가 버튼
  Widget MoreApplyButton() {
    return GestureDetector(
        onTap: () {
          // 도서신청 양식 컨테이너 하나 더 추가되는 기능
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0), // 투명도 0으로 설정
            border: Border.all(width: 1.5, color: Color(0xff2D3C72)),
            borderRadius: BorderRadius.circular(10),
          ),
          child:Center(child: Text(
            '+ 도서 추가',
            style: TextStyle(color: Color(0xff2D3C72)),
          ),),
        ));
  }

  /// 도서신청 버튼
  Widget ApplyButton() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff2D3C72),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
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
        child: const Text('도서 신청 완료하기'),
      ),
    );
  }
}
