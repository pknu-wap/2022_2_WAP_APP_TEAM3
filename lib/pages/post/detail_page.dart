import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/components/custom_text_form_feild.dart';
import 'package:wap_library/components/getDeviceSize.dart';
import 'package:wap_library/pages/main/list_page.dart';
import 'package:wap_library/pages/post/bookshelf_page.dart';
import 'package:wap_library/pages/post/rental_page.dart';
import 'package:wap_library/pages/post/reservation_page.dart';
import 'package:wap_library/pages/post/return_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Widget> pageList = <Widget>[
    ReturnPage(),
    RentalPage(),
    ReservationPage(),
  ];
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': '학생1',
      'pic': 'https://picsum.photos/300/30',
      'message': '책 추천합니다~!'
    },
    {
      'name': '학생2',
      'pic': 'https://picsum.photos/300/30',
      'message': '책 상태가 좋진 않음. 근데 내용은 good'
    },
    {
      'name': '학생2',
      'pic': 'https://picsum.photos/300/30',
      'message': '책 상태가 좋진 않음. 근데 내용은 good'
    },
    {
      'name': '학생2',
      'pic': 'https://picsum.photos/300/30',
      'message': '책 상태가 좋진 않음. 근데 내용은 good'
    },
    {
      'name': '학생2',
      'pic': 'https://picsum.photos/300/30',
      'message': '책 상태가 좋진 않음. 근데 내용은 good'
    },
    {
      'name': '학생2',
      'pic': 'https://picsum.photos/300/30',
      'message': '책 상태가 좋진 않음. 근데 내용은 good'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      shrinkWrap: true,
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          )
      ],
    );
  }

  Widget BookButton(){
    return Column(
      children: [
        ElevatedButton(onPressed: (){},
            child:Text("대출하기")),
        ElevatedButton(onPressed: (){},
            child:Text("위치확인")),
        ElevatedButton(onPressed: (){},
            child:Text("반납하기")),
        ElevatedButton(onPressed: (){},
            child:Text("예약하기")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("도서 상세 정보"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, right: 10),
                    child: Image.asset(
                      'assets/images/bookcover.jpg',
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: BookButton(),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(3)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            '윈도우즈 API 정복 1',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '김상형, 2006년, 1116쪽\n\n휠 마우스가 대중화되었고, 듀얼 모니터를 쓰는 사용자도 많아졌으며, 유니코드가 훨씬 더 중요한 의미를 가지게 되었고, 컴파일러도 새로운 버전이 발표되었으며, 더 다양한 컨트롤들이 필요해진 등 변화의 흐름을 최대한 반영하여 5년 만에 새로 펴낸 개정판이다.',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 500,
                    child: Divider(
                      color: Colors.black12,
                      thickness: 1.0,
                    ),
                  ),
                  Container(
                    child: Text("Book review",
                        style: TextStyle(color: Colors.black38, fontSize: 10)),
                  ),
                  //commentChild(filedata),
                  IntrinsicHeight(
                    child : Container(
                      height: 400,
                      child: CommentBox(
                        userImage:
                        "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
                        child: commentChild(filedata),
                        labelText: 'Write a comment...',
                        withBorder: false,
                        errorText: 'Comment cannot be blank',
                        sendButtonMethod: () {
                          if (formKey.currentState!.validate()) {
                            print(commentController.text);
                            setState(() {
                              var value = {
                                'name': 'New User',
                                'pic':
                                'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                                'message': commentController.text
                              };
                              filedata.insert(0, value);
                            });
                            commentController.clear();
                            FocusScope.of(context).unfocus();
                          } else {
                            print("Not validated");
                          }
                        },
                        formKey: formKey,
                        commentController: commentController,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        sendWidget:
                        Icon(Icons.send_sharp, size: 30, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}