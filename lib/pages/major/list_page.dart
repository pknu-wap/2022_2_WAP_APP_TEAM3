import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/pages/major/firestore_page.dart';
import 'package:wap_library/pages/major/apply_page.dart';
import 'package:wap_library/pages/manager/manager_page.dart';
import 'my_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _currentIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => true);//false로 변경
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff006285),
          title: Text("책 대여 대여"),
          centerTitle: true,
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