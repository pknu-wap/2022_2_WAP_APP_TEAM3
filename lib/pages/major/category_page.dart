import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wap_library/models/category.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wap_library/pages/detail/detail_page.dart';

class Category{
  final String type;

  Category({ //필드를 추가
    required this.type
  });
}
class CategoryRepository {
  final List<Category> _dummyCategory = [
    Category(type: '언어'),
    Category(type: '앱/웹'),
    Category(type: '게임'),
    Category(type: 'AI'),
    Category(type: 'DB'),
  ];

  List<Category> getCategory() {
    return _dummyCategory;
  }
}

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);

  CollectionReference product = FirebaseFirestore.instance.collection('도서 목록');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: <Category>[].length, //item 개수
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 2 / 1, //item 의 가로 1, 세로 2 의 비율
          mainAxisSpacing: 10, //수평 Padding
          crossAxisSpacing: 10, //수직 Padding
        ),
        itemBuilder: (context, index) {
          //item 의 반목문 항목 형성
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            color: Colors.lightGreen,
            child: CategoryTile(category: Category[index]),
          );
        },
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
    final Category category;
    CategoryTile({required this.category});

    @override
    Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Column(
          children: [
            Text(category.type),
            Text('.')
          ]
        )
      )
    );
  }
}
