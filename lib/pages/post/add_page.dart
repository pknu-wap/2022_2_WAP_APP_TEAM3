
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wap_library/components/custom_text_form_feild.dart';
import 'package:wap_library/components/custom_textarea.dart';
import 'package:wap_library/util/vaildator_util.dart';
import 'package:image_picker/image_picker.dart';

import 'camera.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006285),
      ),
      body: Center(

        child: SingleChildScrollView(
          child : Container(
          padding: EdgeInsets.all(25.0),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0,),
          width: 250,
          height: 430,
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
                const Text('도서 추가하기',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: '도서명',
                    hintText: '도서명을 입력하세요',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: '저자명',
                    hintText: '저자명을 입력하세요',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: '출판사명',
                    hintText: '출판사명을 입력하세요',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FloatingActionButton.extended(

                    onPressed: () {
                      showDialog(context: context,

                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content:
                              SizedBox(

                                height: 400,
                                child: Center(

                                  child: const Camera(),
                                ),
                              ),
                              actions: <Widget>[

                                FloatingActionButton.extended(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ;
                                  },
                                  label: Text("완료",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  backgroundColor: Colors.white,

                                ),
                              ],


                            );
                          }
                      );
                    },


                    label: Text("이미지 업로드",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),),
                    backgroundColor: Colors.white,
                    icon: Icon(

                      Icons.wallpaper,

                      size: 30,
                      color: Colors.black,
                    )
                ),


              ]
          ),
        ),
        ),
      ),
    );
  }
}