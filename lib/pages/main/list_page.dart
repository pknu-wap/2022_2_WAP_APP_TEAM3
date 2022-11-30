import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/components/book_list.dart';
import 'package:wap_library/pages/post/detail_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  /*FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> streamData;
  @override
  void initState(){
    super.initState();
    streamData = firestore.collection('도서 목록').snapshots();
  }
  Widget _fetchData(BuildContext context){
    return StreamBuilder(
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (!streamSnapshot.hasData) return LinearProgressIndicator();
        return build _buildBody(context, snapshot.data.documents);
      },
    ),
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot){
    List<Book> books.snapshot.map((d) => Book.fromSnapshot(d)).toList();
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            height: 80,
            child: GestureDetector(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    child: Text("${index+1}", style: TextStyle(fontSize: 13)),
                  ),
                  Image(image: AssetImage("assets/images/bookcover.jpg")),
                  Expanded(child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("윈도우즈 API 정복", style: TextStyle(fontSize: 15),),
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

/*class ListPage extends StatelessWidget {
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  //Stream<QuerySnapshot>  streamData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            height: 80,
            child: GestureDetector(
              child: Row(
                children: [
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    child: Text("${index+1}", style: TextStyle(fontSize: 13)),
                  ),
                  Image(image: AssetImage("assets/images/bookcover.jpg")),
                  Expanded(child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("윈도우즈 API 정복", style: TextStyle(fontSize: 15),),
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
  }*/
//}