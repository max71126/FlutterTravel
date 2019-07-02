import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/screens/home.dart';
import 'package:flutter_travel_concept/widgets/icon_badge.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Home(),
          Home(),
          Home(),
          Home(),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width:7),
            IconButton(
              icon: Icon(
                Icons.home,
                size: 24.0,
              ),
              color: _page == 0
                  ? Theme.of(context).accentColor
                  : Colors.blueGrey[300],
              onPressed: ()=>_pageController.jumpToPage(0),
            ),

            IconButton(
              icon:Icon(
                Icons.favorite,
                size: 24.0,
              ),
              color: _page == 1
                  ? Theme.of(context).accentColor
                  : Colors.blueGrey[300],
              onPressed: ()=>_pageController.jumpToPage(1),
            ),

            IconButton(
              icon: IconBadge(
                icon: Icons.mode_comment,
                size: 24.0,
              ),
              color: _page == 2
                  ? Theme.of(context).accentColor
                  : Colors.blueGrey[300],
              onPressed: ()=>_pageController.jumpToPage(2),
            ),

            IconButton(
              icon: Icon(
                Icons.person,
                size: 24.0,
              ),
              color: _page == 3
                  ? Theme.of(context).accentColor
                  : Colors.blueGrey[300],
              onPressed: ()=>_pageController.jumpToPage(3),
            ),

            SizedBox(width:7),
          ],
        ),
        color: Theme.of(context).primaryColor,

      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
