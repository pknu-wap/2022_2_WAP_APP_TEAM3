import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/pages/manager/add_page.dart';
import 'package:wap_library/pages/detail/reservation_page.dart';
import 'package:wap_library/pages/user/member_information_page.dart';

import '../user/my_apply_page.dart';
import '../user/my_rental_page.dart';
import '../user/my_reservation_page.dart';

///마이페이지
///
/*
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        ///마이페이지박스
        child: Container(
          padding: EdgeInsets.all(25.0),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 50,),
          width: 250,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
              color: Color(0xff006285),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 0,
                  blurRadius: 5.0,
                  offset: Offset(0, 10),
                )
              ]
          ),
          child: Column(

              children: <Widget>[

                SizedBox(
                  height: 25.0,
                ),
                const Text('MY PAGE',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                SizedBox(
                  height: 30.0,
                ),

                OutlinedButton(
                  onPressed: () {Get.to(MemberInformationPage());},
                  child: Text('회원 정보 수정하기')),

                ///대출내역버튼
                FloatingActionButton.extended(
                    onPressed: () {Get.to(BookShelfPage());},
                    label: Text("나의 대출 내역",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    backgroundColor: Colors.white,
                    icon: Icon(
                      Icons.import_contacts_outlined,
                      size: 30,
                      color: Colors.black,
                    )
                ),
                SizedBox(
                  height: 20.0,
                ),
                ///나의예약버튼
                FloatingActionButton.extended(
                    onPressed: () {Get.to(MyReservation());},
                    label: Text("나의 예약 내역",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    backgroundColor: Colors.white,
                    icon: Icon(
                      Icons.book_online_outlined,
                      size: 30,
                      color: Colors.black,
                    )
                ),
                SizedBox(
                  height: 20.0,
                ),
                ///나의신청내역버튼
                FloatingActionButton.extended(
                    onPressed: () {Get.to(AppliedPage());},
                    label: Text("나의 신청 내역",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    backgroundColor: Colors.white,
                    icon: Icon(
                        Icons.check_circle_outlined,
                      size: 30,
                      color: Colors.black,
                    )
                ),


              ]
          ),
        ),

      ),
    );
  }
}
 */

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE9EAEA),
        body: Stack(
          children: [
            Positioned.fill(
              child: backWidget(),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Profile(),
                  ),
                  Expanded(
                    flex: 3,
                    child: MyHistory(),
                  ),
                  Expanded(
                    flex: 7,
                    child: BookOnRental(),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  /// 배경화면
  Widget backWidget() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 4, //비율
          child: Container(
            color: Color(0xff7AABBD),
          ),
        ),
        Expanded(
          flex: 8, //비율
          child: Container(
            color: Color(0xffE9EAEA),
          ),
        ),
      ],
    );
  }

  ///위젯 3개
  Widget Profile() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30, bottom: 5),
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/113813770?s=96&v=4'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MemberInformationPage()));
                  },
                  child: Icon(
                    Icons.settings_outlined,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
        ),
        Text(
          '임은서',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget MyHistory() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      padding: EdgeInsets.all(10.0),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(/// 대출 내역 확인
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyRentalPage()));
            },
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(3)),
                Icon(
                  Icons.book,
                  size: 40,
                  color: Color(0xff006285),
                ),
                Text("대출\n내역 확인", textAlign: TextAlign.center),
              ],
            ),
          ),
          GestureDetector(///에약 내역 확인
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyReservation()));
            },

            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(3)),
                Icon(
                  Icons.date_range,
                  size: 40,color: Color(0xff006285),
                ),
                Text("예약\n내역 확인", textAlign: TextAlign.center)
              ],
            ),
          ),
          GestureDetector(///신청 내역 확인
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyApplyPage()));
            },

            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(3)),
                Icon(
                  Icons.domain_verification,
                  size: 40,color: Color(0xff006285),
                ),
                Text("신청\n도서 확인", textAlign: TextAlign.center)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget BookOnRental() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10.0, right: 10.0),
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

    );
  }
}
