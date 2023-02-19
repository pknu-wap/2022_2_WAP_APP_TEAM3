import 'package:flutter/material.dart';
import 'package:wap_library/pages/major/home_page.dart';
import 'package:get/get.dart';

///도서대출 페이지
class ReservationPage extends StatefulWidget {
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
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
                  SizedBox(height: 30),
                  BookImage(), //책 사진
                  BookData(), // 책 이름, 정보
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Divider(color: Colors.grey, thickness: 0.5)),
                  ReservationDetail(), //대출 상세 설정 칸
                  ReservationButton()
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
  Widget ReservationDetail() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            "예약 상세 설정",
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
            "현 대출자 예정 반납일",
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
          child: ShowReturnDay(),
        ),
        Container(
            margin: EdgeInsets.all(10),
            child: Text('현 대출자가 반납을 하면 알림이 갈 예정입니다.')),
      ]),
    );
  }

  ///반납일 선택
  Widget ShowReturnDay() {
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
          margin: EdgeInsets.symmetric( horizontal: 20),
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

  /// 예약 완료하기 버튼
  Widget ReservationButton() {
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

        ///버튼 누르면 뜨는 팝업
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Container(
                  padding:
                  EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
                  child: Text("도서 예약이\n완료되었습니다.",
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
        child:Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child:Text('도서 예약 완료하기',
            style: TextStyle(
                fontSize: 17
            ),),
        ) ,
      ),
    );
  }
}





/*

import 'package:flutter/material.dart';
import 'package:wap_library/pages/major/home_page.dart';
import 'package:get/get.dart';

///도서예약 페이지

class ReservationPage extends StatefulWidget {
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  DateTime date = DateTime.now();

  @override
  PreferredSizeWidget CustomAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0), // here the desired height
      child: AppBar(
        backgroundColor: Color(0xff2D3C72),
        title: Container(
          padding: EdgeInsets.only(top: 20, left : 10),
          child: Text("도서 예약",
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
              padding: EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              child: Column(
                ///페이지 컨테이너 안 구성요소
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  BookImage(context), //책 사진
                  BookData(context), // 책 이름, 정보
                  const SizedBox(
                    height: 30,
                  ),
                  ReservationDetail(context), //대출 상세 설정 칸
                  const Padding(padding: EdgeInsets.all(15.0))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///책 사진
Widget BookImage(BuildContext context) {
  return Container(
    child: Image.asset(
      'assets/images/bookcover.jpg',
      width: MediaQuery.of(context).size.width * 0.3,
    ),
  );
}

/// 책 이름, 정보
Widget BookData(BuildContext context) {
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

///예약 상세 칸
Widget ReservationDetail(BuildContext context) {
  DateTime date = DateTime.now();
  return Container(
    padding: EdgeInsets.all(3.5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.82,
          padding: const EdgeInsets.only(
              left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Color(0xff3B4C66)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(children: <Widget>[
            //둥근모서리 박스 안 구성요소
            const Text(
              '예약 상세',
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
                  padding: EdgeInsets.only(top: 8.0),
                  child: const Text(
                    '현 대출자 예정 반납일',
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

            Container(
              //반납일 관련 박스
              width: 350, //가로 설정
              height: 60, //높이 설정
              padding: const EdgeInsets.only(
                  left: 10.0, top: 1.0, right: 10.0, bottom: 1.0),
              margin: const EdgeInsets.all(10.0),

              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
              ),

              child: Center(
                child: Text(
                  '${date.year}/${date.month}/${date.day}',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),

            const Text('* 현 대출자가 반납을 하면 알림이 갈 예정입니다.'),

            const SizedBox(
              height: 12.0,
            ),

            Container(
              child: RentalButton(context),
            ),

            /*const Padding(
                padding: EdgeInsets.only(
                    left: 30.0, top: 10.0, right: 10.0, bottom: 0.0),
              ),*/
          ]),
        ),
      ],
    ),
  );
}

/// 예약하기 버튼
Widget RentalButton(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.77,
    height: MediaQuery.of(context).size.height * 0.06,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff3B4C66),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),

      ///예약하기 버튼 누르면 뜨는 팝업
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
                    const Text("도서 예약이 완료되었습니다."),
                    Container(
                      //텍스트 밑의 둥근모서리 박스
                      width: 210, //가로 설정
                      height: 110, //높이 설정
                      padding: EdgeInsets.all(15.0),
                      margin: const EdgeInsets.all(10.0),

                      child: Column(
                        //둥근모서리 박스 안 구성요소
                        children: <Widget>[
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                fixedSize: const Size(180, 70)),
                            onPressed: () {
                              Get.to(HomePage());
                            },
                            child: Text('홈페이지로 돌아가기'),
                          ),
                        ],
                      ),

                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Color(0xff3B4C66)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: const Text('예약하기'),
    ),
  );
}

 */
