import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/pages/manager/add_page.dart';
import 'package:wap_library/pages/detail/reservation_page.dart';
import 'package:wap_library/pages/user/member_information_page.dart';

import '../user/my_apply_page.dart';
import '../user/my_rental_page.dart';
import '../user/my_reservation_page.dart';

///마이페이지
/*class MyPage extends StatelessWidget {
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
}*/

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

Widget backWidget() {
  return Column(
    children: <Widget>[
      Expanded(
        flex: 3,
        child: Container(
          color: Color(0xff006285),
          child: ClipOval(
            child: Image.network(
                'https://i.pinimg.com/236x/56/cc/80/56cc80ea80aff65bc09c7967b993821c.jpg',
                fit: BoxFit.fill),
          ),
        ),
      ),
      Expanded(
        flex: 7,
        child: Container(
          color: Color(0xffE9EAEA),
        ),
      ),
    ],
  );
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9EAEA),
      body: backWidget(),
    );
  }
}
