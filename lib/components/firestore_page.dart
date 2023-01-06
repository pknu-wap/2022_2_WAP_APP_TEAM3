import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wap_library/pages/detail/detail_page.dart';

class FireStorePage extends StatefulWidget {
  const FireStorePage({Key? key}) : super(key: key);

  @override
  State<FireStorePage> createState() => _FireStorePageState();
}

class _FireStorePageState extends State<FireStorePage> {
  CollectionReference product = FirebaseFirestore.instance.collection('도서 목록');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: product.orderBy('번호', descending: false).snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                var bookname=documentSnapshot['책 이름'];
                var bookcate=documentSnapshot['종류'];
                var booknum=documentSnapshot['번호'];

                return Card(
                  child: ListTile(
                    onTap: (){
                      Get.to(DetailPage());
                    },
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 40,
                        minWidth: 40,
                        maxHeight: 60,
                        maxWidth: 60,
                      ),
                      child: Image.network(documentSnapshot['이미지'], fit: BoxFit.cover,),
                    ),
                    title: Text(bookname),
                    subtitle: Text(bookcate),
                  ),
                );
              },
            );
          };
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
