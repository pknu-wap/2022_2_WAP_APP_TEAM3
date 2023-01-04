import 'package:flutter/material.dart';
///나의 책장페이지
class BookShelfPage extends StatefulWidget {
  const BookShelfPage({Key? key}) : super(key: key);


  @override
  _BookShelfPageState createState() => _BookShelfPageState();
}

class PhotoItem extends State<BookShelfPage>{
  final String image;
  final String name;
  PhotoItem(this.image, this.name);

  final List<PhotoItem> _items =[
    PhotoItem("https://image.yes24.com/goods/102347474/XL", "MATLAB를 이용한 디지털영상처리"),
    PhotoItem("http://image.kyobobook.co.kr/images/book/xlarge/162/x9791185294162.jpg", "전기전자공학개론"),
    PhotoItem("https://image.aladin.co.kr/product/2245/60/cover500/8945006591_1.jpg", "프로그래밍 언어론"),
    PhotoItem("https://www.hanbit.co.kr/data/books/B9170552795_l.jpg", "온라인 게임 서버 프로그래밍"),
    PhotoItem("https://image.yes24.com/goods/18077101/XL", "유니티 2D 게임 공작소"),
    PhotoItem("https://bimage.interpark.com/partner/goods_image/9/1/0/0/282559100g.jpg", "foundation of computer science"),
    PhotoItem("https://bimage.interpark.com/partner/goods_image/7/3/8/6/201317386g.jpg", "Compilers"),
    PhotoItem("https://image.yes24.com/goods/60896697/XL", "3D게임 비주얼과 연출의 기술"),
    PhotoItem("https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788956167312.jpg", "전기전자공학개론(개정5판,주황색)"),
    PhotoItem("https://www.hanbit.co.kr/data/books/B4259645859_l.jpg", "소프트웨어 공학"),
    PhotoItem("https://bimage.interpark.com/partner/goods_image/9/1/0/0/282559100g.jpg", "FOUNDATION OF COMPUTER SCIENCE"),
    PhotoItem("https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791156643661.jpg", "전기전자공학개론(하얀색)"),


  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }}


class _BookShelfPageState extends State<BookShelfPage> {


///나의 책장 임시 책이미지 리스트
  final List _items =[
    /*"https://image.yes24.com/goods/102347474/XL"*//* "MATLAB를 이용한 디지털영상처리"),*/
    "http://image.kyobobook.co.kr/images/book/xlarge/162/x9791185294162.jpg", /*"전기전자공학개론"),*/
    "https://image.aladin.co.kr/product/2245/60/cover500/8945006591_1.jpg", /*"프로그래밍 언어론"),*/
    "https://www.hanbit.co.kr/data/books/B9170552795_l.jpg", /*"온라인 게임 서버 프로그래밍"),*/
    "https://image.yes24.com/goods/18077101/XL", /*"유니티 2D 게임 공작소"),*/
    "https://bimage.interpark.com/partner/goods_image/9/1/0/0/282559100g.jpg", /*"foundation of computer science"),*/
    "https://bimage.interpark.com/partner/goods_image/7/3/8/6/201317386g.jpg", /*"Compilers"),*/
    "https://image.yes24.com/goods/60896697/XL", /*"3D게임 비주얼과 연출의 기술"),*/
    "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9788956167312.jpg",/* "전기전자공학개론(개정5판,주황색)"),*/
    "https://www.hanbit.co.kr/data/books/B4259645859_l.jpg", /*"소프트웨어 공학"),*/
    "https://bimage.interpark.com/partner/goods_image/9/1/0/0/282559100g.jpg", /*"FOUNDATION OF COMPUTER SCIENCE"),*/
    "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791156643661.jpg", /*"전기전자공학개론(하얀색)"),*/


  ];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My BookShelf"),
        backgroundColor: Color(0xff006285),
      ),
      body: SingleChildScrollView(
        child : Center(
          child: Column(
            children: /*<Widget>*/ [
              /*SizedBox(
              height: 100,
            ),*/
              Container(
                padding: EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(top:50.0),
                width: 120,
                decoration: BoxDecoration(
                  color: Color(0xff006285),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '나의 책장',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 500,
                height: 450,
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Color(0xff006285),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 0,
                        blurRadius: 5.0,
                        offset: Offset(0, 10),
                      )
                    ]),
                ///그리드뷰
                child: GridView.count(
                  crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                  childAspectRatio: 2 / 3, //item 의 가로 1, 세로 2 의 비율
                  mainAxisSpacing: 20, //수평 Padding
                  crossAxisSpacing: 20, //수직 Padding
                  children: List.generate(_items.length, (index) {

                    //item 의 반목문 항목 형성
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,



                      ),
                      child: Image.network(_items[index]),
                      ///채울 이미지 지정
                    );

                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}