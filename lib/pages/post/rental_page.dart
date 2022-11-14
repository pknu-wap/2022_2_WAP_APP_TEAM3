import 'package:flutter/material.dart';
import 'package:get/get.dart';

///도서대출 페이지
class RentalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('도서 대출') ,
      ),

      body: Container(
        height: 1100,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [

            /// 책 사진
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child : Image.asset(
                    'assets/images/bookcover.jpg',
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                ),
              ],
            ),

            Padding(padding: EdgeInsets.all(3)),

            /// 책 이름, 정보
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      '윈도우즈 API 정복 1',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '김상형, 2006년, 1116쪽',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  )
                ],
              ),
            ),

            ///대출 상세 설정 칸
            Container(
              width: 350, //가로 설정
              height: 250, //높이 설정
              padding: EdgeInsets.all(15.0),
              margin: const EdgeInsets.all(10.0),

              child: Column( //둥근모서리 박스 안 구성요소
                children: <Widget>[
                  Text(
                    '대출 상세 설정',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
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
      ),
    );
  }
}