import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//manager랑 병합할때 이름 바꿔야함
class SearchPage_m extends StatefulWidget {
  _SearchSreenState createState() => _SearchSreenState();
}

class _SearchSreenState extends State<SearchPage_m> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";

  _SearchSreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('검색'), backgroundColor: Color(0xff2D3C72),),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
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
                        suffixIcon: focusNode.hasFocus
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
                        hintText: '검색',
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