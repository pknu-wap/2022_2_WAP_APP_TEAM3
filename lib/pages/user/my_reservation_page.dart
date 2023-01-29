import 'package:flutter/material.dart';
import 'package:wap_library/pages/user/my_rental_page.dart';
///나의 예약 페이지
class MyReservation extends StatefulWidget {
  const MyReservation({Key? key}) : super(key: key);


  @override
  _MyReservationState createState() => _MyReservationState();
}

var reservationCounter = false;

Widget bookWidget(context) {
  return Container(
    margin: EdgeInsets.only(top: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  ///원 기호
                  margin: EdgeInsets.only(right: 40),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color(0xff2B4088),
                    shape: BoxShape.circle,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      ///날짜
                      '2023.03.17 ~ 2023.05.17',
                      style: TextStyle(color: Color(0xff767676)),
                    ),
                    Container(
                      ///책 제목
                      margin: EdgeInsets.only(top: 20),
                      child: Text('jQuery를 활용한 인터렉티브\n웹 콘텐츠 제작'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 40),
          child: Image.asset(
            ///책 사진
            'assets/images/bookcover.jpg',
            width: MediaQuery.of(context).size.width * 0.2,
          ),
        ),
      ],
    ),
  );
}

Widget noneBook(context) {
  return Container(
    alignment: Alignment(0.0,0.0),
    margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.4),
    child: Text(""
        "예약하신 내역이 없습니다.", style: TextStyle(color: Color(0xffA8A8A8), fontSize: 20),),
  );
}

class _MyReservationState extends State<MyReservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("나의 예약 내역"),
        backgroundColor: Color(0xff2B4088),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          ///Column자체를 위쪽 중앙을로 정렬
          children: [
            if (reservationCounter == false) ...[
              noneBook(context)
            ] else ...[
              bookWidget(context),
              bookWidget(context),
              bookWidget(context),
              bookWidget(context),
              bookWidget(context),
            ]
          ],
        ),
      ),
    );
  }
}