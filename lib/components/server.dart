import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';

///네트워크 요청하기
/*Future<http.Response> fetchPost() {
  return http.get(Uri.https("localhost:5040','/db-connection"));
}*/

class BookInfo{
  final int id;
  final String name;
  final String category;


  BookInfo(
      {required this.id,
        required this.name,
        required this.category});

  factory BookInfo.fromJson(Map<String, dynamic> json){
    return BookInfo(
        id : json["id"],
        name: json["name"],
        category : json['category']
    );
  }
}


Future<List<BookInfo>> fetchBookInfo() async{
  var url = "http://localhost:5040/db-connection";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200){
    print("응답했다");
    return (json.decode(response.body) as List).map((e)
        => BookInfo.fromJson(e)).toList();
  }
  else{
    throw Exception("실패했습니다.");
  }
}

///class 생성하기
class BookListWidget extends StatefulWidget{
  const BookListWidget({Key?key}):super(key:key);
  @override
  _BookListWidgetState createState() => _BookListWidgetState();

}
class  _BookListWidgetState extends State<BookListWidget>{
  late Future<List<BookInfo>>futureBookInfo;

  @override
  void initState(){
    super.initState();
    futureBookInfo = fetchBookInfo();
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder<List<BookInfo>>(
      future: futureBookInfo,
      builder: (context, snapshot){
        if (snapshot.hasData){
          return Column(
            children: <Widget>[
              ...snapshot.data!.map((e)=> SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 4,
              child: Text(e.name!),
            ),
          )),
            ],
          );
        }else if(snapshot.hasError){
          return Text('$snapshot.hasError');
        }
        return const CircularProgressIndicator();
      }
    );
  }

}