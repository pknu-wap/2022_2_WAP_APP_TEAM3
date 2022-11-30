/*import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var firestore = FirebaseFirestore.instance;
  var collection = "도서 목록";
  var doc;
  var booktitle;
  var booknumber;
  var bookcate;

  // get result => null;

  @override
  void initState() {
    booktitle ??= "";
    print("init:" + booktitle);
  }

  @override
  Widget build(BuildContext context) {
    print("build:" + booktitle);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("강의 : $booktitle"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  child: Text("Create", //////////////////////////
                      style: TextStyle(fontSize: 50, color: Colors.white)),
                  onPressed: () {
                    firestore
                        .collection(collection)
                        .doc(doc)
                        .set({'만족도': 100, 'title': '왕초보를 위한 엑셀 매크로 VBA'});
                    print('save');
                    //클릭시 데이터를 추가해준다.
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: Text("Read", //////////////////////////
                      style: TextStyle(fontSize: 50, color: Colors.white)),
                  onPressed: () {
                    firestore
                        .collection(collection)
                        .doc(doc)
                        .get()
                        .then((DocumentSnapshot ds) {
                      if (ds.data() == null) {
                        setState(() {
                          booktitle = "없음";
                        });
                      } else {
                        Map<String, dynamic> map =
                        ds.data() as Map<String, dynamic>;

                        setState(() {
                          booktitle = map['booktitle'];
                        });
                      }
                      print("read:" + booktitle);
                    }); //firesotre
                  }, //onpressed
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: Text("Update", ///////////////////////////
                      style: TextStyle(fontSize: 50, color: Colors.white)),
                  onPressed: () {
                    firestore
                        .collection(collection)
                        .doc(doc)
                        .update({"title": '자바로 게임 만들기'});
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  child: Text("Delete", ////////////////////////////
                      style: TextStyle(fontSize: 50, color: Colors.white)),
                  onPressed: () {
                    //특정 document 삭제
                    firestore.collection(collection).doc(doc).delete();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }*/
//}