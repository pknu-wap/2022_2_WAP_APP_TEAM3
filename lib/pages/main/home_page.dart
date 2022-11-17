import 'package:animations/animations.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wap_library/pages/main/apply_page.dart';
import 'package:wap_library/pages/main/list_page.dart';
import 'package:wap_library/pages/main/manager_page.dart';
import 'package:wap_library/pages/main/my_page.dart';
import 'package:wap_library/pages/post/Search_page.dart';

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
    ListPage(),
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
          title: Text("책 대여 대여"),
          centerTitle: true,
          //automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.manage_accounts),
              onPressed: () {
                Get.to(ManagerPage());
              },
            ),
            IconButton( //검색창 아이콘
                onPressed: (){Get.to(SearchPage());
                },
                icon: Icon(Icons.search))
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
              title: Text('Apply Book'),
              icon: Icon(Icons.menu_book),
            ),
            BottomNavyBarItem(
              title: Text('Book List'),
              icon: Icon(Icons.home),
            ),
            BottomNavyBarItem(
              title: Text('My Page'),
              icon: Icon(Icons.person_rounded),
            ),
          ],
        ),
      ),
    );
  }
}