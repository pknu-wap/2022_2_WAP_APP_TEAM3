import 'package:flutter/material.dart';
import 'package:wap_library/pages/main/home_page.dart';
import 'package:wap_library/pages/post/detail_page.dart';
import 'package:get/get.dart';

///도서대출 페이지
class RentalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('도서 대출'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 700,
            height: 1000,
            padding: EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            child: Column(
              ///페이지 컨테이너 안 구성요소
              children: [
                BookImage(), //책 사진
                BookData(), // 책 이름, 정보
                RentalDetail(), //대출 상세 설정 칸
                const Padding(padding: EdgeInsets.all(15.0))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///책 사진
class BookImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/bookcover.jpg',
        width: MediaQuery.of(context).size.width * 0.3,
      ),
    );
  }
}

/// 책 이름, 정보
class BookData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: const Text(
              '윈도우즈 API 정복 1',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: const Text(
            '김상형, 2006년, 1116쪽',
            style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

///대출 상세 설정 칸
class RentalDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400, //가로 설정
            height: 280, //높이 설정
            padding: const EdgeInsets.only(
                left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
            margin: const EdgeInsets.all(10.0),

            decoration: BoxDecoration(
              //컨테이너 데코레이션
              border: Border.all(width: 3, color: Colors.lightGreen),
              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              children: <Widget>[
              //둥근모서리 박스 안 구성요소
              const Text(
                '대출 상세 설정',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                  //구분선
                  width: 500,
                  child: Divider(color: Colors.grey, thickness: 1.5)),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top:8.0),
                    child: const Text(
                      '반납일을 선택해주세요.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),

              Container( //반납일 관련 박스
                width: 350, //가로 설정
                height: 70, //높이 설정
                padding: const EdgeInsets.only(
                    left: 10.0, top: 1.0, right: 10.0, bottom: 1.0),
                margin: const EdgeInsets.all(10.0),

                decoration: BoxDecoration(//컨테이너 데코레이션
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                child: SelectDayButton(), //대출날짜 고르는 버튼
              ),


              const Text('* 최대 대출 가능 기간은 1학기입니다.'),

                const SizedBox(
                  height: 12.0,
                ),

              Container(
                child: RentalButton(),
              ),

              const Padding(
                padding: EdgeInsets.only(
                    left: 30.0, top: 10.0, right: 10.0, bottom: 0.0),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

///반납일 고르는 버튼 + 선택에 따라 날짜가 수정되는 박스
class SelectDayButton extends StatelessWidget {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('날짜를 선택해주세요'),
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2023),
            );

            // if 'CANCEL' => null
            if (newDate == null) return;

            // if 'OK' => DateTime
          }
        ),

        const SizedBox( // 사이 여백
          width: 30.0,
        ),

        Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            //컨테이너 데코레이션
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: Text(
            '${date.year}/${date.month}/${date.day}',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ]
    );
  }
}

/// 대출하기 버튼
class RentalButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width *0.77,
      height: MediaQuery.of(context).size.height *0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),

        ///대출하기 버튼 누르면 뜨는 팝업
        onPressed: (){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Icon(Icons.check_circle),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget> [
                      Text("도서 대출이 완료되었습니다."),

                      Container( //텍스트 밑의 둥근모서리 박스
                        width: 210, //가로 설정
                        height: 110, //높이 설정
                        padding: EdgeInsets.all(15.0),
                        margin: const EdgeInsets.all(10.0),

                        child: Column( //둥근모서리 박스 안 구성요소
                          children: <Widget>[
                            OutlinedButton( // 버튼2
                              style: OutlinedButton.styleFrom(
                                  fixedSize: const Size(180,70)
                              ),
                              onPressed:() {Get.to(HomePage());},
                              child: Text('홈페이지로 돌아가기'),
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
        child: Text('대출하기'),
      ),
    );
  }
}