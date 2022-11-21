import 'package:flutter/material.dart';

class AppiledPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("My list"),
      ),
      body: Center(

        child: Column(
          children: <Widget>[
            Container(
              width: 140,

              decoration:
              BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text('나의 신청현황',
                textAlign: TextAlign.center,
                style: TextStyle(

                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
            ),


            Container(
              width: 500,
              height: 450,
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(30),


              decoration:
              BoxDecoration(
                  color: Colors.blue,
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





              child: GridView.count(
                crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                childAspectRatio: 2 / 3, //item 의 가로 1, 세로 2 의 비율
                mainAxisSpacing: 20, //수평 Padding
                crossAxisSpacing: 20, //수직 Padding
                children: List.generate(12, (index) {  //item 의 반목문 항목 형성
                  return Container(
                    color: Colors.lightGreen,
                    child: Text(' Item : $index'),
                  );
                }),
              ),

            ),
          ],
        ),
      ),


    );
  }
}