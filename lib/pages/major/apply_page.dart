import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wap_library/pages/major/my_page.dart';
import '../user/my_apply_page.dart';
import 'package:wap_library/pages/major/home_page.dart';

///도서신청 페이지

class ApplyPage extends StatefulWidget {
  State<ApplyPage> createState() => _ApplyPageState(appBarTitle: 'ApplyPage~');
}

class _ApplyPageState extends State<ApplyPage> {
  final String appBarTitle;
  late List<Widget> entries = [ApplyFormatBox()];
  late int n;

  _ApplyPageState({required this.appBarTitle});

  @override
  void initState() {
    super.initState();
    n = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    '도서 신청을 위한 양식을 입력해 주세요.',
                    style: TextStyle(
                      color: Color(0xff2D3C72),
                    ),
                  ),
                ),
                Column(
                  children: List.generate(entries.length, (index) {
                    return entries[index];
                  }),
                ),

                //List<Widget> 만드신다음에 ListView.builder 사용하시고
                //버튼 누르면 .add해서 setState하면
                /*ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return ApplyFormatBox();
                    }),*/

                MoreApplyButton(),
                //Spacer(), // 이 아래 위젯을 가장 아래에 고정시키는 위젯
                ApplyButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*

  Widget ApplyListView() {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ApplyFormatBox();
        });
  }
*/
  Widget ApplyFormatBox() {
    return Container(
      ///도서신청 양식 기입 박스
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1.5, color: Colors.black38),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 0,
            blurRadius: 5.0,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: ApplyFormat(),
    );
  }

  Widget ApplyFormat() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            "도서$n",
            style: TextStyle(fontSize: 18),
          ),
        ),
        TextInput(), //출판사명 기입
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
        )
      ],
    );
  }

  /// 도서추가 버튼
  Widget MoreApplyButton() {
    return GestureDetector(
        onTap: () {
          setState(() {
            n++;
            entries.add(ApplyFormatBox());
          });
          // 도서신청 양식 컨테이너 하나 더 추가되는 기능
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0), // 투명도 0으로 설정
            border: Border.all(width: 1.5, color: Color(0xff2D3C72)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              '+ 도서 추가',
              style: TextStyle(color: Color(0xff2D3C72)),
            ),
          ),
        ));
  }

  /// 도서신청 버튼
  Widget ApplyButton() {
    return GestureDetector(
      onTap: () {
        ///신청하기 버튼 누르면 뜨는 팝업
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Container(
                padding:
                    EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
                child: Text(
                  "도서 신청이\n완료되었습니다.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2D3C72),
                  ),
                ),
              ),
              content:IntrinsicHeight(
                child: Column(children: [
                GestureDetector(
                  onTap: () {
                    Get.to(MyApplyPage());
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.domain_verification,
                          color: Color(0xff2D3C72),
                        ),
                        SizedBox(width: 10),
                        Text("나의 신청내역 보러가기"),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(HomePage());
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.home_filled,
                          color: Color(0xff2D3C72),
                        ),
                        SizedBox(width: 10),
                        Text("홈페이지로 돌아가기"),
                      ],
                    ),
                  ),
                ),
              ]),),
            );
          },
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Color(0xff2D3C72),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: const Text(
            '도서 신청 완료하기',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class TextInput extends StatefulWidget {
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  TextEditingController textarea_n = TextEditingController();
  TextEditingController textarea_w = TextEditingController();
  TextEditingController textarea_p = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _text = " ";

  BookNameInputState() {
    textarea_n.addListener(() {
      setState(() {
        _text = textarea_n.text;
      });
    });
  }

  WriterNameInputState() {
    textarea_w.addListener(() {
      setState(() {
        _text = textarea_w.text;
      });
    });
  }

  PublisherNameInputState() {
    textarea_p.addListener(() {
      setState(() {
        _text = textarea_p.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: textarea_n,
            onChanged: (bookname) {},
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: '도서명',
              helperText: '',
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: textarea_w,
            onChanged: (bookname) {},
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: '저자명',
              helperText: '',
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: textarea_p,
            onChanged: (bookname) {},
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: '출판사명',
              helperText: '',
            ),
          ),
        ),
      ],
    );
  }
}

/*

//책 이름 기입 위젯
class BookNameInput extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: TextField(
      controller: textarea_n,
      onChanged: (bookname) {},
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        labelText: '도서명',
        helperText: '',
      ),
    ),
  );
}}

//저자명 기입 위젯
Widget WriterNameInput() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: TextField(
      controller: textarea_w,
      onChanged: (bookname) {},
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        labelText: '저자명',
        helperText: '',
      ),
    ),
  );
}

//출판사명 기입 위젯
Widget PublisherNameInput() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: TextField(
      controller: textarea_p,
      onChanged: (bookname) {},
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        labelText: '출판사명',
        helperText: '',
      ),
    ),
  );
}


 */
