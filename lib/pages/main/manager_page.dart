import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/pages/post/add_page.dart';

import '../post/remove_page.dart';
import '../post/search_page.dart';

///관리자페이지
class ManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Management"),
        backgroundColor: Color(0xff006285),
      ),
      body: Center(
        child:
        ///관리자메뉴박스
        Container(
          padding: EdgeInsets.all(25.0),
            margin: EdgeInsets.fromLTRB(0, 0, 0, 50,),
            width: 250,
            height: 340,
            decoration:
                BoxDecoration(
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
              const Text('관리자 메뉴',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                SizedBox(
                  height: 20.0,
                ),
                ///도서추가버튼
                FloatingActionButton.extended(
                    onPressed: () {Get.to(AddPage());},
                    label: Text("도서 추가하기",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),),
                    backgroundColor: Colors.white,
                  icon: Icon(
                      Icons.post_add_outlined,
                    size: 30,
                    color: Colors.black,
                  )
                ),
                SizedBox(
                  height: 20.0,
                ),
                ///도서삭제버튼
                FloatingActionButton.extended(
                    onPressed: () {Get.to(RemovePage());},
                    label: Text("도서 삭제하기",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    backgroundColor: Colors.white,
                    icon: Icon(
                        Icons.delete_outlined,
                      size: 30,
                      color: Colors.black,
                    )
                ),
                SizedBox(
                  height: 20.0,
                ),
                ///도서조회버튼
                FloatingActionButton.extended(
                    onPressed: () {Get.to(SearchPage());},
                    label: Text("도서 조회하기",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    backgroundColor: Colors.white,
                    icon: Icon(

                      Icons.manage_search_outlined,

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
