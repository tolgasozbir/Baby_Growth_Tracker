import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import 'package:timeline_tile/timeline_tile.dart';
import 'package:where_is_my_potty_mom/models/baby.dart';
import 'package:where_is_my_potty_mom/models/babyDAL.dart';
import 'package:where_is_my_potty_mom/models/memory.dart';
import 'package:where_is_my_potty_mom/models/myIcons.dart';
import 'package:where_is_my_potty_mom/screens/BMIScreen.dart';
import 'package:where_is_my_potty_mom/screens/babySizeScreen.dart';
import 'package:where_is_my_potty_mom/screens/diaryScreen.dart';
import 'package:where_is_my_potty_mom/screens/memoryScreen.dart';

class MemoriesScreen extends StatefulWidget {

  @override
  _MemoriesScreenState createState() => _MemoriesScreenState();
}

class _MemoriesScreenState extends State<MemoriesScreen> {

  List<Color> colors=[
    const Color(0xFFFF2448),
    const Color(0xFFFF0000),
    const Color(0xFFFF7600),
    const Color(0xFFFFB300),
    const Color(0xFFFFD500),
    const Color(0xFF8CFE00),
    const Color(0xFF00E86C),
    const Color(0xFF00F4F2),
    const Color(0xFF00CCFF),
    const Color(0xFF70A2FF),
    const Color(0xFFA96CFF),
    const Color(0xFFE040FB),
  ];

  List<Color> colorsBack=[
    const Color(0x11FF2448),
    const Color(0x11FF0000),
    const Color(0x11FF7600),
    const Color(0x11FFB300),
    const Color(0x11FFD500),
    const Color(0x118CFE00),
    const Color(0x1100E86C),
    const Color(0x1100F4F2),
    const Color(0x1100CCFF),
    const Color(0x1170A2FF),
    const Color(0x11A96CFF),
    const Color(0x11E040FB),
  ];


  Future<List<Memory>> getMemories() async{
    var list=await BabyDal().getAllMemories();
    for (var item in list) {
      memoryList.add(item);
    }
    return list;
  }

  List<Memory> memoryList=[];


  List<Baby> babyList=[];
  var x = BabyDal().getAll();

  Future<List<Baby>> getBabies() async{
    var list=await BabyDal().getAll();
    for (var item in list) {
      print("******");
      print(item.id);
      print(item.name);
      babyList.add(item);
    }
    return list;
  }


@override
  void initState() {
    super.initState();
    getMemories();
    getBabies();




  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return Scaffold(
        appBar: AppBar(
          title: Text("Anılar"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const  AlwaysScrollableScrollPhysics(),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ////  memory cards  ////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [screens(context,DiaryScreen(),"Günlük",Icons.favorite),screens(context,MemoryScreen(),"Notlar ve Anılar",Icons.star)],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [screens(context,BabySizeScreen(babyList),"Boy & Kilo",Icons.trending_up),screens(context,BMIScreen(),"VKİ Hesaplama",Icons.equalizer)],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12,left: 8,right: 8,bottom: 16),
                      child: Divider(
                        color: Colors.amber,
                        thickness: 4,
                      ),
                    ),
                    ////  Time Line  ////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                        child: Icon(MyIconSwipe.swipe, size: 24.sp,)),
                        Text("Zaman Çizelgesi", style: TextStyle(color: Colors.purple.shade900, fontWeight: FontWeight.w500, fontSize: 24),),
                        Icon(MyIconSwipe.swipe, size: 24.sp,),
                      ],
                    ),
                    timeLineFirst(),
                    timeLine(),      
                    //Container(height: 64,), index%colors.length
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    );
  }



  Widget timeLine() {
    return Scrollbar(
      radius: Radius.circular(10),
      thickness: 8,
      child: Container(
        width: 99.w,
        height: 60.h,
        child: FutureBuilder<List<Memory>>(
          future: getMemories(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              var memories=snapshot.data;
              return ListView.builder(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: memories!.length,
                itemBuilder: (context,index){
                  var memory=memories[memories.length-1-index];
                  return TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.25,
                    afterLineStyle: LineStyle(color: colors[index%colors.length]),
                    beforeLineStyle: LineStyle(color: colors[index%colors.length]),
                    indicatorStyle: IndicatorStyle(
                      iconStyle: IconStyle(iconData: Icons.favorite,fontSize: 24.sp,color: colors[index%colors.length]),
                      color: Colors.transparent
                    ),
                    startChild: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(memory.date),
                    ),
                    endChild: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 13.h
                      ),
                      child: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container( decoration: BoxDecoration(color: colorsBack[index%colors.length], border: Border.all(color: colors[index%colors.length], width: 1 )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(child: Text(memory.title,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),)),
                                Text("\n" + memory.memory,style: TextStyle(fontSize: 12.sp),maxLines: 1.h.toInt(), overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                          ),
                        ),
                        onTap: (){
                          showMemory(index);
                        },
                      ),
                    ),
                  );
                }
              );
            }
            else{
              return Container();
            }
          }
        ),
      ),
    );
  }

  TimelineTile timeLineFirst() {
    return TimelineTile(
      isFirst: true,
      afterLineStyle: LineStyle(color: Colors.transparent),
      alignment: TimelineAlign.manual,
      lineXY: 0.25,
      indicatorStyle: IndicatorStyle(
        iconStyle: IconStyle(iconData: Icons.favorite_outline,fontSize: 25.sp,color: Color(0xFFFF0000),),
        color: Colors.transparent
      ),
      startChild: Center(child: Text("Anlar")),
      endChild: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 50),
        child: Padding(padding: const EdgeInsets.only(top: 16,left: 8,right: 8),
          child: Text(" Burada Anılar ve Notlarınız Yer Alır."),
        ),
      ),
    );
  }

Future<dynamic> showMemory(int index) {
    return showDialog(
        context: context, builder: (context){
          return AlertDialog(
            title: Center(child: Text(memoryList[memoryList.length - 1 -index].date, )),
            content: Scrollbar(
              child: Container(
                height: 100.h,
                width: 100.w,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.file(File(memoryList[memoryList.length - 1 -index].image)),
                      Text(memoryList[memoryList.length - 1 -index].title, style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold), ),
                      Text("\n"+memoryList[memoryList.length - 1 -index].memory, ),
                    ],
                  ),
                  )
                ),
              ),
          );
        }
      );
  }


  Widget screens(BuildContext context, dynamic screen, String menuName,IconData icon) {   /////////////////  icon parametresi alcan  //////////////////////////////////
    return SizedBox(
      height: 25.h,//h/4,
      width: 48.w,//w/2, //200x200
      child: GestureDetector(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
          elevation: 4,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(icon,size: 20.w/*72*/,color: Colors.lightBlueAccent.shade200,),
              Positioned(
                bottom: 12,
                child: Text(menuName ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.grey.shade600),)
              ),
            ],
          )
        ),
        onTap: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>DiaryScreen()));
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, _) {
              return screen;//DiaryScreen();
            },
            opaque: false)
          );
        },
      ),
    );
  }


}
