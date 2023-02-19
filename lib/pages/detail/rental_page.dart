import 'package:flutter/material.dart';
import 'package:wap_library/pages/major/home_page.dart';
import 'package:get/get.dart';

///도서대출 페이지
class RentalPage extends StatefulWidget {
  State<RentalPage> createState() => _RentalPageState();
}

class _RentalPageState extends State<RentalPage> {
  DateTime date = DateTime.now();
  String writer = '김상형';
  String code = '111.3.11';
  String publisher = '한빛미디어';

  @override
  PreferredSizeWidget CustomAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0), // here the desired height
      child: AppBar(
        backgroundColor: Color(0xff2D3C72),
        title: Container(
          padding: EdgeInsets.only(top: 20, left: 10),
          child: Text(
            "도서 대출",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(10.0),
              child: Column(
                ///페이지 컨테이너 안 구성요소
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  BookImage(), //책 사진
                  BookData(), // 책 이름, 정보
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Divider(color: Colors.grey, thickness: 0.5)),
                  RentalDetail(), //대출 상세 설정 칸
                  RentalButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///책 사진
  Widget BookImage() {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 0,
          blurRadius: 5.0,
          offset: Offset(10, 10),
        )
      ]),
      child: Image.asset(
        'assets/images/bookcover.jpg',
        width: MediaQuery.of(context).size.width * 0.2,
      ),
    );
  }

  /// 책 이름, 정보
  Widget BookData() {
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
            child: Text(
              '저자 $writer   청구기호 $code   출판사 $publisher',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  ///대출 상세 설정
  Widget RentalDetail() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            "대출 상세 설정",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "반납일",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: SelectDayButton(), //대출날짜 고르는 버튼
        ),
        Container(
            margin: EdgeInsets.all(10),
            child: Text('최대 대출 가능 기간은 한 학기(180일)입니다.')),
      ]),
    );
  }

  ///반납일 선택
  Widget SelectDayButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      GestureDetector(
        onTap: () async {
          DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(
              Duration(days: 180),
            ),
          );

          // if 'CANCEL' => null
          if (newDate == null) return;

          // if 'OK' => DateTime
          setState(() => date = newDate);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: const Icon(Icons.calendar_month),
        ),
      ),
      const SizedBox(
        width: 30.0,
      ),
      Container(
        child: Text(
          '${date.year}년 ${date.month}월 ${date.day}일',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    ]);
  }

  /// 대출하기 버튼
  Widget RentalButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff2D3C72),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),

        ///대출하기 버튼 누르면 뜨는 팝업
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Container(
                  padding:
                      EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
                  child: Text("도서 대출이\n완료되었습니다.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2D3C72),
                  ),),
                ),
                content: GestureDetector(
                  onTap: () {
                    Get.to(HomePage());
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.home_filled,
                        color: Color(0xff2D3C72),),
                        SizedBox(width: 10),
                        Text("홈페이지로 돌아가기"),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            '도서 대출 완료하기',
            style: TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
