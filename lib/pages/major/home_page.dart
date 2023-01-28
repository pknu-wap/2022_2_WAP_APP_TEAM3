import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/pages/major/firestore_page.dart';
import 'package:wap_library/pages/major/apply_page.dart';
import 'package:wap_library/pages/manager/manager_page.dart';
import 'category_page.dart';
import 'my_page.dart';

//홈페이지 안에 카테고리 페이지, 리스트페이지 안에 파이어스토어페이지

/*
Appbar title 페이지마다 바뀌게 하려고 시도해본 방법
1. 우선 다른 페이지 Scaffold에서 Appbar(title(...))을 넣으면 앱바가 한 페이지에 두개 생긴다
2. Appbar title 변수를 생성해서 각 페이지마다 변수 값을 받게 하려했으나 잘 안됨...
3. 아예 Appbar를 사용하지 않고 body에 column을 넣어 앱바처럼 생긴 컨테이너를 넣으려고 하였으나 왜인지 모르게 화면구성이 이상하게 뜬다.
 */

// 4번째 아이디어 : 계획을 세워보자.
// Appbar를 계승한 위젯을 하나 만든다. CustomAppbar.
// 이 CustomAppbar는 void InitState()가 title = Text('Category')이다.
// _appbarTitle = 페이지이름
// SetState : Pagechanged가 되면 _appbarTitle을 바꾸기
// Appbar return값을 복붙한다.

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);
  List<Widget> pageList = <Widget>[
    ApplyPage(),
    CategoryPage(),
    MyPage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () {
        return Future(() => true); //false로 변경
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0), // here the desired height
          child: AppBar(
            backgroundColor: Color(0xff2D3C72),
            title: Container(
              padding: EdgeInsets.only(top: 20, left : 10),
              child: Text('Category',
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
        ),
        body: SizedBox.expand(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  print(index);
                  setState(() => _currentIndex = index);
                },
                children: pageList,
              ),
            ),

        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              activeColor: Color(0xff006285),
              title: Text('Apply Book',
                  style: TextStyle(color: Color(0xff006285))),
              icon: Icon(
                Icons.menu_book,
                color: Color(0xff006285),
              ),
            ),
            BottomNavyBarItem(
              activeColor: Color(0xff006285),
              title:
                  Text('Book List', style: TextStyle(color: Color(0xff006285))),
              icon: Icon(
                Icons.home,
                color: Color(0xff006285),
              ),
            ),
            BottomNavyBarItem(
              activeColor: Color(0xff006285),
              title:
                  Text('My Page', style: TextStyle(color: Color(0xff006285))),
              icon: Icon(
                Icons.person_rounded,
                color: Color(0xff006285),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// 4번째 아이디어 : 계획을 세워보자.
// Appbar를 계승한 위젯을 하나 만든다. CustomAppbar.
// 이 CustomAppbar는 void InitState()가 title = Text('Category')이다.
// _appbarTitle = 페이지이름
// SetState : Pagechagned가 되면 _appbarTitle을 바꾸기
