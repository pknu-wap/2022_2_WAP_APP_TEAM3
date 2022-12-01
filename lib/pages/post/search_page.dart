import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  _SearchSreenState createState() => _SearchSreenState();
}

class _SearchSreenState extends State<SearchPage> {
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

  /*Widget _buildBody(BuildContext context){
    return StreamBuilder<QuerySnapshot>(stream: Firestore.in,)
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('검색'),
        backgroundColor: Color(0xff006285),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              /*color: Colors.black12,*/
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 10,
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
                            child: Text(
                              '취소',
                              style: TextStyle(color: Colors.black54),
                            ),
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
          StreamBuilder<QuerySnapshot>(
            stream: (_searchText!="" && _searchText!= null)
            ? FirebaseFirestore.instance
            .collection('책 제목')
            .where("searchKeywords", arrayContains: _searchText)
            .snapshots()
            : FirebaseFirestore.instance.collection("책 제목").snapshots(),
            builder: (context, snapshot){
              return (snapshot.connectionState == ConnectionState.waiting)
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index){
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return Container(
                      padding: EdgeInsets.only(top:16),
                      child: Column(
                        children: [
                          ListTile(
                            leading: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: 40,
                                minWidth: 40,
                                maxHeight: 60,
                                maxWidth: 60,
                              ),
                              child: Image.network(data['이미지'], fit: BoxFit.cover,),
                            ),
                            title: Text(data['책 제목']),
                            subtitle: Text(data['종류']),
                          )
                        ],
                      ),
                    );
              },);
            }
          )],
        ),
      ),
    );
  }
}
