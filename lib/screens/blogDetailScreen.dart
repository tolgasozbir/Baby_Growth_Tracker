import 'package:flutter/material.dart';
import 'package:baby_growth_tracker/screens/blog/blogPage1.dart';
import 'package:baby_growth_tracker/screens/blog/blogPage2.dart';

// ignore: must_be_immutable
class BlogDetailScreen extends StatelessWidget {

int gelenindex=0;
String gelenImgString="";
String gelenTitle="";

BlogDetailScreen(int index,String imgString){
  gelenindex=index;
  gelenImgString=imgString;
}
final screen=[
  BlogPage1("Çocuklarda Tuvalet Eğitimine Ne Zaman Başlanmalı?"),
  BlogPage2("Adım Adım Çocuklarda Tuvalet Eğitimi"),
  /*Blog1Text()*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Hero(
                  tag: gelenindex,
                  child: Image.asset(gelenImgString),
                ),
                screen[gelenindex],
                ElevatedButton(
                  child: Text("Blog Sayfasına Geri Dön"),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}