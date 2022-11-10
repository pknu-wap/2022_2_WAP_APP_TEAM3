import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/components/custom_elevated_button.dart';
import 'package:wap_library/pages/post/detail_page.dart';


///도서신청 페이지
class ApplyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BookNameInput(), //도서명
          WriterNameInput(), //저자명
          PublisherNameInput(), //출판사명
          ApplyButton(), //신청버튼
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
        ],
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
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize:40),
      minimumSize: Size(200,100)
    );

    return Container(
      width: MediaQuery.of(context).size.width *0.5,
      height: MediaQuery.of(context).size.height *0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: (){ // 버튼을 눌렀을 때
          Navigator.of(context).pushNamed('');
        },
        child: Text('신청하기'),
      ),
    );
  }
}