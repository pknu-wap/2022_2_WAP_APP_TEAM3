import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/pages/post/detail_page.dart';

class ListPage extends StatelessWidget {
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  //Stream<QuerySnapshot>  streamData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10.0),
            height: 80,
            child: GestureDetector(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    child: Text("${index+1}",
                        style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Image(image: AssetImage("assets/images/bookcover.jpg")),
                  Expanded(child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("윈도우즈 API 정복", style: TextStyle(fontSize: 17),),
                  )),
                ],
              ),
              onTap:() {
                Get.to(DetailPage());
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}