import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/pages/major/firestore_page.dart';
import 'package:wap_library/pages/major/apply_page.dart';
import 'package:wap_library/pages/manager/manager_page.dart';
import 'category_page.dart';
import 'my_page.dart';

//홈페이지 안에 카테고리 페이지, 리스트페이지 안에 파이어스토어페이지

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(appBarTitle:'Category~');
}

class _HomePageState extends State<HomePage> {
  final String appBarTitle;
  _HomePageState({
    required this.appBarTitle
  });

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
              child: Text(appBarTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            actions: [
              IconButton(
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
        body:     SizedBox.expand(
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
