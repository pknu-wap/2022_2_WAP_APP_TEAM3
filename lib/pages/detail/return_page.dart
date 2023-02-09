import 'package:flutter/material.dart';
import 'package:wap_library/pages/major/home_page.dart';
import 'package:get/get.dart';

///도서대출 페이지
class ReturnPage extends StatefulWidget {
  State<ReturnPage> createState() => _ReturnPageState();
}

class _ReturnPageState extends State<ReturnPage> {
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
            "도서 반납",
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
                  ReturnDetail(), //대출 상세 설정 칸
                  ReturnButton()
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

  ///반납 상세 설정
  Widget ReturnDetail() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            "반납 상세 정보",
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
            "대출일자",
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
          child: ShowRentalDay(), //대출날짜 고르는 버튼
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "반납일자",
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
      ]),
    );
  }

  ///대출 일자
  Widget ShowRentalDay() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.calendar_month),
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

  ///반납일자 (오늘)
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

  /// 반납하기버튼
  Widget ReturnButton() {
    return Container(
      margin: EdgeInsets.only(top: 30),
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
                  child: Text("도서 반납이\n완료되었습니다.",
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
            '도서 반납 완료하기',
            style: TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}

/*

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
} */
