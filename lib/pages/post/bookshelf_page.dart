import 'package:flutter/material.dart';

class BookShelfPage extends StatefulWidget {
  const BookShelfPage({Key? key}) : super(key: key);

  @override
  _BookShelfPageState createState() => _BookShelfPageState();
}

class _BookShelfPageState extends State<BookShelfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GridView.count(
          crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
          mainAxisSpacing: 10, //수평 Padding
          crossAxisSpacing: 10, //수직 Padding
          children: List.generate(9, (index) {  //item 의 반목문 항목 형성
            return Container(
              color: Colors.lightGreen,
              child: Text(' Item : $index'),
            );
          }),
        ),

    );
  }
}