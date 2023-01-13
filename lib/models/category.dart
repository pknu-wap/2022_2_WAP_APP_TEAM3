import 'package:flutter/material.dart';
import 'package:wap_library/pages/major/category_page.dart';

class Category{
  final String type;

  Category({ //필드를 추가
    required this.type,
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