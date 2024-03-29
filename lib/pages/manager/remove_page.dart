import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
///도서 삭제 페이지
class RemovePage extends StatefulWidget {
  _SearchSreenState createState() => _SearchSreenState();
}

class _SearchSreenState extends State<RemovePage> {
  final TextEditingController _filter = TextEditingController(); ///검색위젯컨트롤
  FocusNode focusNode = FocusNode(); ///검색위젯위에 커서가 있는가?
  String _searchText = ""; ///현재검색값

  _SearchSreenState() {
    _filter.addListener(() { ///filter가 변화를 감지하여 searchText의 값 변화시킴
      setState(() {
        _searchText = _filter.text;
      });
    });
  }



  /*Widget _buildBody(BuildContext context){
    return StreamBuilder<QuerySnapshot>(stream: Firestore.in,)
  }*/
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget CustomAppbar() {
      return PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child: AppBar(
          backgroundColor: Color(0xff2D3C72),
          title: Container(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "관리자 _ 도서삭제 페이지",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppbar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              /*color: Colors.black12,*/
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: TextField(
                      focusNode: focusNode,
                      style: TextStyle(fontSize: 15),
                      autofocus: true,
                      controller: _filter,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffF2F3F5),
                        prefixIcon:
                        Icon(Icons.search, color: Colors.black26, size: 20),
                        suffixIcon: focusNode.hasFocus ///우측에 보이기 위한 아이콘
                            ? IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.black26,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              _filter.clear();
                              _searchText = "";
                            });
                          },
                        )
                            : Container(),
                        hintText: '도서명',
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                  focusNode.hasFocus
                      ? Expanded(
                    child: TextButton(
                      child: Text('취소', style: TextStyle(color: Colors.black54),),
                      onPressed: () {
                        setState(() {
                          _filter.clear();
                          _searchText = "";
                          focusNode.unfocus();
                        });
                      },
                    ),
                  )
                      : Expanded(
                    flex: 0,
                    child: Container(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}