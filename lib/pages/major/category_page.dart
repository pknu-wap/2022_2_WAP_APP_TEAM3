import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wap_library/pages/detail/detail_page.dart';
import 'package:wap_library/pages/major/list_page.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:wap_library/pages/major/home_page.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);

  List<CategoryButton> CategoryButtonList = [
    CategoryButton(categoryName: '게임/그래픽/영상처리'),
    CategoryButton(categoryName: '공학'),
    CategoryButton(categoryName: '자료구조/알고리즘/패턴'),
    CategoryButton(categoryName: '교양'),
    CategoryButton(categoryName: '네트워크'),
    CategoryButton(categoryName: '순수과학'),
    CategoryButton(categoryName: '언어'),
    CategoryButton(categoryName: '웹/앱'),
    CategoryButton(categoryName: '임베디드'),
    CategoryButton(categoryName: 'DB/OS'),
    CategoryButton(categoryName: '보안/인공지능'),
    CategoryButton(categoryName: '기타')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Table(
            defaultColumnWidth: FixedColumnWidth(
                MediaQuery.of(context).size.width * 0.45 // 표 세로줄의 가로 길이
                ),
            children: [
              TableRow(
                  children: [CategoryButtonList[0], CategoryButtonList[1]]),
              TableRow(
                  children: [CategoryButtonList[2], CategoryButtonList[3]]),
              TableRow(
                  children: [CategoryButtonList[4], CategoryButtonList[5]]),
              TableRow(
                  children: [CategoryButtonList[6], CategoryButtonList[7]]),
              TableRow(
                  children: [CategoryButtonList[8], CategoryButtonList[9]]),
              TableRow(
                  children: [CategoryButtonList[10], CategoryButtonList[11]]),
            ],
          ),
        ),
    );
  }
}

//버튼 커스터마이징
class CategoryButton extends StatelessWidget {
  final String categoryName;

  CategoryButton({
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff7AABBD),
      height: MediaQuery.of(context).size.height * 0.1,
      margin: EdgeInsets.all(5),
      child: TextButton(
        child: Text(
          categoryName,
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ListPage()));
        },
      ),
    );
  }
}
