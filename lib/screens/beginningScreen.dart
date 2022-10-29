import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:baby_growth_tracker/models/baby.dart';
import 'package:baby_growth_tracker/models/babyDAL.dart';
import 'package:baby_growth_tracker/screens/addBabyScreen.dart';
import 'package:baby_growth_tracker/screens/photoAlbumScreen.dart';

class BeginningScreen extends StatefulWidget {

  @override
  _BeginningScreenState createState() => _BeginningScreenState();
}

class _BeginningScreenState extends State<BeginningScreen> {

  Future<List<Baby>> getBabies() async{
    var list=await BabyDal().getAll();
    for (var item in list) {
      print("******");
      print(item.id);
      print(item.name);
      print(item.age);
      print(item.gender);
      print(item.img);
    }
    return list;
  }

  Future<Null> refresh() async{
    await Future.delayed(Duration(seconds: 1));
    setState(() {  });
  }

  @override
  void initState() {
    super.initState();
    getBabies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebekler"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddBabyScreen()));
        },
        child: Icon(Icons.add,),
      ),
      body: buildBody(),
    );
  }

  FutureBuilder<List<Baby>> buildBody() {
    return FutureBuilder<List<Baby>>(
      future: getBabies(),
      builder: (context,snapshot){
        if (snapshot.hasData) {
        var babyList=snapshot.data;
        return RefreshIndicator(
          onRefresh: refresh,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), //pull down to refresh
            itemCount:babyList!.length,
            itemBuilder: (context,index){
              var baby=babyList[index];
              return GestureDetector(
                child: Slidable(
                  //TODO
                  startActionPane: pane(),
                  // actionExtentRatio: 0.25,
                  // secondaryActions: [
                  //   slideLeftActDelete(baby.id),
                  //   //slideLeftActUpdate(),       //Düzenleme eklencek
                  //   slideForwardArrowIcon(),
                  // ],
                  // actions: [
                  //   slideBackArrowIcon(),
                  //   //slideRightActUpdate(),
                  //   slideRightActDelete(baby.id),
                  // ],
                  child: SizedBox(
                    height: 160,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Color.fromARGB(255, 80, 0, 140),
                        //elevation: 12,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                        child: Row(
                          children: [
                            circleImage(baby),
                            babyInfo(baby),
                            rightIcon(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AlbumScreen()));
                },
              );
            },
          ),
        );
          }
        else{
          return Container();
        }
      }
    );
  }

  ActionPane pane() {
    return ActionPane(
      motion: SizedBox(),
      children: [

      ],
    );
  }

  // ActionPane slideForwardArrowIcon() {
  //   return IconSlideAction(
  //     caption: "İptal",
  //     icon: Icons.arrow_forward,
  //     color: Colors.grey,
  //     foregroundColor: Colors.black,
  //   );
  // }

  // IconSlideAction slideLeftActUpdate() {
  //   return IconSlideAction(
  //     caption: "Güncelle",
  //     icon: Icons.update,
  //     color: Colors.amber,
  //     foregroundColor: Colors.white,
  //     onTap: (){
  //       print("güncel tıklandı");
  //     },
  //   );
  // }

  // IconSlideAction slideRightActUpdate() {
  //   return IconSlideAction(
  //     caption: "Güncelle",
  //     icon: Icons.update,
  //     color: Colors.amber,
  //     foregroundColor: Colors.white,
  //     onTap: (){
  //       print("güncel tıklandı");
  //     },
  //   );
  // }

  // IconSlideAction slideLeftActDelete(int id) {
  //   return IconSlideAction(
  //     caption: "Sil",
  //     icon: Icons.delete,
  //     color: Colors.red,
  //     foregroundColor: Colors.white,
  //     onTap: (){
  //       BabyDal().deleteBaby(id);
  //       setState(() {  });
  //     },
  //   );
  // }

  // IconSlideAction slideRightActDelete(int id) {
  //   return IconSlideAction(
  //     caption: "Sil",
  //     icon: Icons.delete,
  //     color: Colors.red,
  //     foregroundColor: Colors.white,
  //     onTap: (){
  //       BabyDal().deleteBaby(id);
  //       setState(() {   });
  //     },
  //   );
  // }

  Expanded rightIcon() {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Icon(Icons.chevron_right, color: Colors.white70,size: 110,),
        ),
      ),
    );
  }

  Expanded circleImage(Baby baby) {
    return Expanded(
      child: baby.img==null ?
       Container(
        width: 150.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.yellow, width: 3.0, style: BorderStyle.solid),
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/bebek.jpg"),
          ),
        ),
      )
      :
        Container(
          width: 150.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.yellow, width: 3.0, style: BorderStyle.solid),
            image: DecorationImage(
              fit: BoxFit.cover,
              image:FileImage(
                File(baby.img.toString()),
              ),
          ),
        ),
      ),
    );
  }

  Padding babyInfo(Baby baby) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(baby.name, style: TextStyle(fontSize: 32,fontWeight: FontWeight.w500, color: Colors.white),),),
              Text(baby.age.toString() + " Yaşında", style: TextStyle(color: Colors.white60),),
              baby.gender=="Erkek" ? Icon(Icons.male, color: Colors.white38,size: 70,) : Icon(Icons.female, color: Colors.white38,size: 70,)
          ],
        ),
      ),
    );
  }

  
}