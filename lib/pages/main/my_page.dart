import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/pages/post/add_page.dart';
import 'package:wap_library/pages/post/reservation_page.dart';

import '../post/applied_page.dart';
import '../post/bookshelf_page.dart';
import '../post/my_reservation.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 150,),
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
                  height: 20.0,
                ),
                const Text('MY PAGE',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                SizedBox(
                  height: 20.0,
                ),
                FloatingActionButton.extended(
                    onPressed: () {Get.to(BookShelfPage());},
                    label: Text("나의 책장",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    backgroundColor: Colors.white,
                    icon: Icon(
                      Icons.import_contacts_outlined,
                      size: 30,
                      color: Colors.black,
                    )
                ),
                SizedBox(
                  height: 20.0,
                ),
                FloatingActionButton.extended(
                    onPressed: () {Get.to(MyReservation());},
                    label: Text("나의 예약",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    backgroundColor: Colors.white,
                    icon: Icon(
                      Icons.book_online_outlined,
                      size: 30,
                      color: Colors.black,
                    )
                ),
                SizedBox(
                  height: 20.0,
                ),
                FloatingActionButton.extended(
                    onPressed: () {Get.to(AppiledPage());},
                    label: Text("나의 신청내역",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    backgroundColor: Colors.white,
                    icon: Icon(
                        Icons.check_circle_outlined,
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
