import 'package:flutter/material.dart';
import 'package:wap_library/components/custom_text_form_feild.dart';
import 'package:wap_library/components/custom_textarea.dart';
import 'package:wap_library/util/vaildator_util.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
                body: Center(

                        child: Container(
                        padding: EdgeInsets.all(25.0),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 150,),
                        width: 250,
                        height: 340,
                        decoration:
                              BoxDecoration(
                              color: Colors.white,
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
                                color: Colors.black,
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


                ]
                ),
                ),
                ),
                );
  }
}