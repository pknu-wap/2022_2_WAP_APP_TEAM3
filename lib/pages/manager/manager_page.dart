import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/pages/manager/add_page.dart';
import 'package:wap_library/pages/manager/search_page.dart';
import 'remove_page.dart';

///관리자페이지
class ManagerPage extends StatelessWidget {
  PreferredSizeWidget CustomAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0), // here the desired height
      child: AppBar(
        backgroundColor: Color(0xff2D3C72),
        title: Container(
          padding: EdgeInsets.only(top: 20, left: 10),
          child: Text(
            "관리자 페이지",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.6,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xff2D3C72),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 0,
                blurRadius: 5.0,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    '관리자 메뉴',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                ///도서추가버튼
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //컨테이너 데코레이션
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.post_add_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "도서 추가하기",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.to(AddPage());
                  },
                ),

                ///도서 삭제버튼
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //컨테이너 데코레이션
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "도서 삭제하기",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.to(RemovePage());
                  },
                ),

                ///도서 조회하기
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //컨테이너 데코레이션
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.manage_search_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "도서 조회하기",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.to(SearchPage());
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
