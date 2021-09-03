import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:where_is_my_potty_mom/screens/blogDetailScreen.dart';
import 'package:where_is_my_potty_mom/models/blogPageStrings.dart';

class BlogScreen extends StatefulWidget {

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {

  var images=BlogPageStrings().imageString();
  var titles=BlogPageStrings().titleString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog"),
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, 
            childAspectRatio: 2 / 1
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 200,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Hero(tag: index, child: Image.asset(images[index], fit: BoxFit.cover)),
                    ClipRRect( 
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Colors.black.withOpacity(0.4),
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(titles[index],style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.white),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context)=> BlogDetailScreen(index,images[index])));
              Navigator.push(context,PageRouteBuilder(transitionDuration: Duration(milliseconds: 750),pageBuilder: (_, __, ___) => BlogDetailScreen(index,images[index])));
            },
          );
        },
      ),
    );
  }
}

