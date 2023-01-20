import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/pages/manager/add_page.dart';
import 'package:wap_library/pages/detail/reservation_page.dart';
import 'package:wap_library/pages/user/member_information_page.dart';

import '../user/my_apply_page.dart';
import '../user/my_rental_page.dart';
import '../user/my_reservation_page.dart';

///마이페이지

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
          GestureDetector(
            /// 대출 내역 확인
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyRentalPage()));
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
          GestureDetector(
            ///에약 내역 확인
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyReservation()));
            },

            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(3)),
                Icon(
                  Icons.date_range,
                  size: 40,
                  color: Color(0xff006285),
                ),
                Text("예약\n내역 확인", textAlign: TextAlign.center)
              ],
            ),
          ),
          GestureDetector(
            ///신청 내역 확인
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyApplyPage()));
            },

            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(3)),
                Icon(
                  Icons.domain_verification,
                  size: 40,
                  color: Color(0xff006285),
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
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 3)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '대출 중인 책',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "어떤 책을\n반납하시겠어요?",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3, color: Color(0xff3B4C66)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: BookOnRentalList(),
                                ),
                                Container(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('취소'),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Text('반납하기 >')),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          BookOnRentalList(),
        ],
      ),
    );
  }

  Widget BookOnRentalList() {
    return Row(
      children: [
        Image.asset(
          'assets/images/bookcover.jpg',
          height: MediaQuery.of(context).size.height * 0.21,
        ),
        Image.network(
          'https://thumbnail7.coupangcdn.com/thumbnails/remote/300x300ex/image/rs_quotation_api/f1xesksf/e1b4848999704881b50227b68a707336.jpg',
          height: MediaQuery.of(context).size.height * 0.21,
        ),
      ],
    );
  }
}
