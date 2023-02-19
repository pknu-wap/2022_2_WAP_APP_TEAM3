import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/pages/major/firestore_page.dart';
import 'package:wap_library/pages/major/home_page.dart';
import 'package:wap_library/pages/major/apply_page.dart';
import 'package:wap_library/pages/manager/manager_page.dart';
import 'my_page.dart';

class ListPage extends StatefulWidget {
  ListPage({
    Key? key,
    required this.listName,
  }) : super(key: key);

  late String listName;

  @override
  State<ListPage> createState() => _ListPageState();
}


class _ListPageState extends State<ListPage> {
  int _currentIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);
  late String _appBarTitle;

  List<Widget> pageList = <Widget>[
    ApplyPage(),
    FireStorePage(),
    MyPage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void changeTitle() {
    setState(() { //_currentIndex가 왼쪽부터 순서대로 0, 1, 2인 것 확인
      if (_currentIndex == 0)
        _appBarTitle = '도서신청' ;
      else if (_currentIndex == 1)
        _appBarTitle = widget.listName;
      else _appBarTitle = '마이페이지';
    });
  }

  void initState() {
    super.initState();
    _appBarTitle = widget.listName;
  }

  @override
  PreferredSizeWidget CustomAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0), // here the desired height
      child: AppBar(
        backgroundColor: Color(0xff2D3C72),
        title: Container(
          padding: EdgeInsets.only(top: 20, left : 10),
          child: Text(_appBarTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(top: 20, left : 10),
            icon: Icon(Icons.manage_accounts),
            onPressed: () {
              Get.to(ManagerPage());
            },
          ),
          /*IconButton( //검색창 아이콘
                onPressed: (){Get.to(SearchPage());
                },
                icon: Icon(Icons.search))*/
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => true);//false로 변경
      },
      child: Scaffold(
        appBar: CustomAppbar(),
            /*IconButton( //검색창 아이콘
                onPressed: (){Get.to(SearchPage());
                },
                icon: Icon(Icons.search))*/
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              print(index);
              setState(() => _currentIndex = index);
              changeTitle();
            },
            children: pageList,
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
            changeTitle();
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              activeColor: Color(0xff006285),
              title: Text('Apply Book', style: TextStyle(color : Color(0xff006285))),
              icon: Icon(Icons.menu_book, color: Color(0xff006285),),
            ),
            BottomNavyBarItem(
              activeColor: Color(0xff006285),
              title: Text('Book List', style: TextStyle(color : Color(0xff006285))),
              icon: Icon(Icons.home, color: Color(0xff006285),),
            ),
            BottomNavyBarItem(
              activeColor: Color(0xff006285),
              title: Text('My Page', style: TextStyle(color : Color(0xff006285))),
              icon: Icon(Icons.person_rounded,color: Color(0xff006285),),
            ),
          ],
        ),
      ),
    );
  }
}