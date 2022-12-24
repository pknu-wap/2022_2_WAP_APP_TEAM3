import 'package:flutter/material.dart';
import 'package:wap_library/pages/main/home_page.dart';
import 'package:get/get.dart';

/// 도서반납 페이지!

class ReturnPage extends StatefulWidget {
  State<ReturnPage> createState() => _ReturnPageState();
}

class _ReturnPageState extends State<ReturnPage> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('도서 반납'),
        backgroundColor: Color(0xff006285),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              child: Column(
                ///페이지 컨테이너 안 구성요소
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  BookImage(context), //책 사진
                  BookData(context), // 책 이름, 정보
                  SizedBox(
                    height: 30,
                  ),
                  ReturnDetail(context), //반납 상세 정보 칸
                  const Padding(padding: EdgeInsets.all(15.0))
                ],
              ),
            ),
          ),
        ),
      ),
    );
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

  ///반납 상세 정보 칸
  Widget ReturnDetail(BuildContext context) {
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
              //컨테이너 데코레이션
              border: Border.all(width: 3, color: Color(0xff3B4C66)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //둥근모서리 박스 안 구성요소
                const Text(
                  '반납 상세 정보',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                    //구분선
                    width: 500,
                    child: Divider(color: Colors.grey, thickness: 1.5)),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RentalDate(context),
                    ReturnDeadline(context),
                    const Padding(padding: EdgeInsets.all(10.0)),
                  ],
                ),

                Container(
                  child: ReturnButton(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///대출일자 박스
  Widget RentalDate(BuildContext context) {
    DateTime date = DateTime.now();

    return Container(
      width: 125,
      height: 130,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "대출일자",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 22.0),
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: Text(
              '${date.year}/${date.month}/${date.day}',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  ///반납기한 박스
  Widget ReturnDeadline(BuildContext context) {
    DateTime date = DateTime.now();
    return Container(
      width: 125,
      height: 130,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "반납기한",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 22.0),
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: Text(
              '${date.year}/${date.month}/${date.day}',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  /// 반납하기 버튼
  Widget ReturnButton(BuildContext context) {
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

        ///반납하기 버튼 누르면 뜨는 팝업
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Icon(Icons.check_circle),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text("도서 반납이 완료되었습니다."),
                      Container(
                        //텍스트 밑의 둥근모서리 박스
                        width: 210,
                        //가로 설정
                        height: 110,
                        //높이 설정
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
                          border:
                              Border.all(width: 3, color: Color(0xff3B4C66)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        child: Text('반납하기'),
      ),
    );
  }
}
