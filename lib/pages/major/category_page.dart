import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wap_library/pages/detail/detail_page.dart';
import 'package:wap_library/pages/major/list_page.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);

  List<CategoryButton> CategoryButtonList = [
    CategoryButton(categoryName:'1. 게임/그래픽/영상처리'),
    CategoryButton(categoryName:'2. 공학'),
    CategoryButton(categoryName:'3. 자료구조/알고리즘/패턴'),
    CategoryButton(categoryName:'4. 교양'),
    CategoryButton(categoryName:'5. 네트워크'),
    CategoryButton(categoryName:'6. 순수과학'),
    CategoryButton(categoryName:'7. 언어'),
    CategoryButton(categoryName:'8. 웹/앱'),
    CategoryButton(categoryName:'9. 임베디드'),
    CategoryButton(categoryName:'10. DB/OS'),
    CategoryButton(categoryName:'11. 보안/인공지능'),
    CategoryButton(categoryName:'12. 기타')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Table(
        defaultColumnWidth: FixedColumnWidth(
          MediaQuery.of(context).size.width * 0.45 // 표 세로줄의 가로 길이
        ),

        children: [
          TableRow(
              children: [CategoryButtonList[0], CategoryButtonList[1]]
          ),
          TableRow(
              children: [CategoryButtonList[2], CategoryButtonList[3]]
          ),
          TableRow(
              children: [CategoryButtonList[4], CategoryButtonList[5]]
          ),
          TableRow(
              children: [CategoryButtonList[6], CategoryButtonList[7]]
          ),
          TableRow(
              children: [CategoryButtonList[8], CategoryButtonList[9]]
          ),
          TableRow(
              children: [CategoryButtonList[10], CategoryButtonList[11]]
          ),

        ],
      ),),
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
      color: Colors.orange[100],
      height: MediaQuery.of(context).size.height * 0.11,
      margin: EdgeInsets.all(5),
      child: TextButton(
        child: Text(categoryName),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ListPage())
          );
        },
      ),
    );
  }
}
