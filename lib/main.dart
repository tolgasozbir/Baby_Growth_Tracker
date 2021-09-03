
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:where_is_my_potty_mom/screens/beginningScreen.dart';
import 'package:where_is_my_potty_mom/screens/blogScreen.dart';
import 'package:where_is_my_potty_mom/models/navbar_key.dart';
import 'package:where_is_my_potty_mom/screens/memoriesScreen.dart';
import 'package:where_is_my_potty_mom/screens/reminderScreen.dart';
import 'package:where_is_my_potty_mom/screens/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  PageController _pageController = PageController(
    initialPage: 0
  );
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index){                
        },
        children: [
          BeginningScreen(),
          MemoriesScreen(),
          ReminderScreen(),
          BlogScreen(),
        ],
      ),
      
      bottomNavigationBar: CurvedNavigationBar(
        key: NavbarKey.getKey(),
        color: Colors.blue,
        index: selectedIndex,
        backgroundColor: Colors.transparent,
        items: [
          Icon(Icons.home_outlined,size: 30,),
          Icon(Icons.favorite_outline,size: 30,),
          Icon(Icons.notifications_active_outlined, size: 30,),
          Icon(Icons.my_library_books_outlined,size: 30,),
        ],
        onTap: (index){
            _pageController.jumpToPage(index);
            //_pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.linear);
        },
      ),
    );
  }



}


