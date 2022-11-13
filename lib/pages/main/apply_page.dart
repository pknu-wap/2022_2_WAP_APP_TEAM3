import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/components/custom_elevated_button.dart';
import 'package:wap_library/pages/post/detail_page.dart';

///도서신청 페이지
class ApplyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 500, //가로 설정
            height: 500, //높이 설정
            padding: EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(30.0),

            child: Column( ///페이지 컨테이너 안 구성요소
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

            decoration: BoxDecoration( //컨테이너 데코레이션
              border: Border.all(
                  width: 3,
                  color: Colors.lightGreen
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        )
      ),
    );
  }
}

///책 이름 기입
class BookNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20,5,20,5),
      child: TextField(
        onChanged: (bookname) {},
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: '도서명',
          helperText: '',
        ),
      ),
    );
  }
}

///저자명 기입 위젯
class WriterNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20,5,20,5),
      child: TextField(
        onChanged: (bookname) {},
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: '저자명',
          helperText: '',
        ),
      ),
    );
  }
}

///출판사명 기입 위젯
class PublisherNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20,5,20,5),
      child: TextField(
        onChanged: (bookname) {},
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: '출판사명',
          helperText: '',
        ),
      ),
    );
  }
}

/// [신청하기] 버튼
class ApplyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width *0.77,
      height: MediaQuery.of(context).size.height *0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),

        ///신청하기 버튼 누르면 뜨는 팝업
        onPressed: (){
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Icon(Icons.access_alarm_outlined),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget> [
                    Text("도서 신청이 완료되었습니다."),
                    Container( //텍스트 밑의 둥근모서리 박스
                      width: 210, //가로 설정
                      height: 210, //높이 설정
                      padding: EdgeInsets.all(15.0),
                      margin: const EdgeInsets.all(10.0),

                      child: Column( //둥근모서리 박스 안 구성요소
                        children: <Widget>[
                          ///버튼 두개
                          OutlinedButton( // 버튼1
                            style: OutlinedButton.styleFrom(
                              fixedSize: const Size(180,70),
                            ),
                            onPressed:() {},
                            child: Text('더 신청할 책이 있어요'),
                          ),

                          Container( // 버튼 사이 여백
                            height: 25,
                            child: Text(''),
                          ),

                          OutlinedButton( // 버튼2
                            style: OutlinedButton.styleFrom(
                              fixedSize: const Size(180,70)
                            ),
                            onPressed:() {},
                            child: Text('나의 신청 내역 보러가기'),
                          ),
                        ],
                      ),

                      decoration: BoxDecoration( //컨테이너 데코레이션
                        border: Border.all(
                            width: 3,
                            color: Colors.lightGreen
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              );
            }
          );
        },
        child: Text('신청하기'),
      ),
    );
  }
}

