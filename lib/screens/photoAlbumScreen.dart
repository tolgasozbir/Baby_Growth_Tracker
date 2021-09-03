import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AlbumScreen extends StatefulWidget {

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
        return Scaffold(
          appBar: AppBar(
            title: Text("Albüm"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildBody(),
          ),
        );
      }
    );
  }

  Widget buildBody() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1/1,
      ),
      itemCount: 100,
      itemBuilder: (BuildContext context, index) {
        return Card(
          elevation: 2,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Icon(Icons.photo_camera,color: Colors.black45,),
          );
      }
    );
  }


}
