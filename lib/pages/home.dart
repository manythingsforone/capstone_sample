import 'package:flutter/material.dart';
import 'package:pre_coin_prepare/loading.dart';
import '../coin_screen.dart';
import 'cal.dart';
import 'package:pre_coin_prepare/components/tiledNewsView.dart';
import 'package:pre_coin_prepare/components/topbar.dart';
import 'package:pre_coin_prepare/components/welcomeWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:pre_coin_prepare/components/calendar.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePage createState()=> _HomePage();
}
class _HomePage extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;

    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Center(
        child: Container(
            width: size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopBar(),
                        SizedBox(height: 10),
                        WelcomeWidget(),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  //NewsCarousel(),
                  SizedBox(
                    height: 15,
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [TiledNewsView()],
                    ),
                  )

                ],
              ),
            )),

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '메인 화면',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fiber_new_rounded),
            label: '뉴스',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '알림',
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Loading()));
            }
            if (index == 1) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }
            if (index == 2) {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TableBasicsExample()));
            }
          });
        },
      ),

    );
  }


}