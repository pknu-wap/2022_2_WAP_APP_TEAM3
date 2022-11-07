import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/pages/post/add_page.dart';

class ManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Management"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(AddPage());
              },
              child: Text("도서추가하기"),
            ),
            ElevatedButton(
              onPressed: () {
                //Get.to() 반납 페이지
              },
              child: Text("도서제거하기"),
            ),
            ElevatedButton(
              onPressed: () {
                //Get.to() 반납 페이지
              },
              child: Text("도서조회하기"),
            ),
          ],
        ),
      ),
    );
  }
}
