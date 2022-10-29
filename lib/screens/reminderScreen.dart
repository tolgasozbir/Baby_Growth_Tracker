
          //// HATA VAR AKTİF GÖRÜNMÜYORLARR ///

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:baby_growth_tracker/models/notify.dart';
import 'package:baby_growth_tracker/models/myIcons.dart';

class ReminderScreen extends StatefulWidget {

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {

  Duration duration=Duration(hours: 3, minutes: 0);

  bool switchNappy=false;
  Duration timeNappy = Duration(hours: 3, minutes: 0);

  bool switchFeed=false;
  Duration timeFeed = Duration(hours: 2, minutes: 30);

  bool switchSleep=false;
  Duration timeSleep = Duration(hours: 3, minutes: 0);

  bool switchMedicine=false;
  Duration timeMedicine = Duration(hours: 6, minutes: 0);

  bool switchSize=false;
  Duration timeSize = Duration(hours: 23, minutes: 59);

  bool switchCustom=false;
  Duration timeCustom = Duration(hours: 2, minutes: 0);
  var tfControllerMessage=TextEditingController();
  String customNotifyMessage="";


  String twoDigits(int n)=>n.toString().padLeft(2,'0');
  String formatDuration(Duration duration){
    String twoDigits(int n)=>n.toString().padLeft(2,'0');
    final hours=twoDigits(duration.inHours);
    final minutes=twoDigits(duration.inMinutes.remainder(60));
    return '$hours:$minutes';
  }
  
  Duration durationTimer=Duration(milliseconds: 1000);
  bool isLoading=true;

  Future loadData() async{
    Timer(durationTimer, finishLoad);
  }

  finishLoad() async{
  return setState(() {this.isLoading=false;});    
  }

  @override
  void initState() {
    super.initState();
    noti.setOnNotificationReceive(onNotificationReceive);
    noti.setOnNotificationClick(onNotificationClick);
    checkReminders(101, switchNappy, timeNappy, "nappyYear", "nappyMonth", "nappyDay", "nappyH", "nappyM", "nappyS");
    checkReminders(102, switchFeed, timeFeed, "feedYear", "feedMonth", "feedDay", "feedH", "feedM", "feedS");
    checkReminders(103, switchSleep, timeSleep, "sleepYear", "sleepMonth", "sleepDay", "sleepH", "sleepM", "sleepS");
    checkReminders(104, switchMedicine, timeMedicine, "medicineYear", "medicineMonth", "medicineDay", "medicineH", "medicineM", "medicineS");
    checkReminders(105, switchSize, timeSize, "sizeYear", "sizeMonth", "sizeDay", "sizeH", "sizeM", "sizeS");
    checkReminders(106, switchCustom, timeCustom, "customYear", "customMonth", "customDay", "customH", "customM", "customS");
    loadData();
  }

  onNotificationReceive(ReceiveNotification notification){
    print(notification.id);
  }

  onNotificationClick(String payload){
    print(payload);
  }


  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return Scaffold(
        appBar: AppBar(
          title: Text("Hatırlatmalar"),
        ),
        body: SafeArea(
          child: Center(
            child: isLoading 
            ? GridView.count(     ////////////////   shimmer effecti eklencek  ////////////////////
              crossAxisCount: 1,
              childAspectRatio: 3.6.h/1.h,//3.6/1,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: [
                shimmerEffect(),
                shimmerEffect(),
                shimmerEffect(),
                shimmerEffect(),
                shimmerEffect(),
                shimmerEffect(),
              ],
            )
            : GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 3.6.h/1.h,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: [
                ElevatedButton(onPressed: (){
                  noti.testNotify();
                }, child: Text("test")),
                babyNappy(context,1),
                babyFeed(context,2),
                babySleep(context,3),
                babyMedicine(context,4),
                babySize(context, 5),
                babyCustom(context, 6),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      );
    },
    );
  }

  Card babyNappy(BuildContext context, int id) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: switchNappy == true
              ? Icon(MyIcons.diaper,color: Colors.amber,size: 52)
              : Icon(Icons.baby_changing_station,color: Colors.purple.shade900,size: 52),
            title: Text("Bez",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            subtitle: Text(formatDuration(timeNappy) + " Saat Sonra",style: TextStyle(fontSize: 18,)),
            trailing: Switch(
              activeColor: Colors.amber,
              value: switchNappy,
              onChanged: (veri) {
                setState(() {
                  switchNappy = veri;
                });
                print(veri);
                if (veri) {
                  final hours = twoDigits(timeNappy.inHours);
                  final minutes =twoDigits(timeNappy.inMinutes.remainder(60));
                  noti.notifyNappy(int.parse(hours), int.parse(minutes));
                } 
                else {
                  inactiveReminder("nappyYear");
                  noti.notifyCancel(101);
                }
              }
            ),
            onTap: () {
              if (!switchNappy) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Kaç Dakika Sonra?"),
                      content: Container(
                        child: timePicker(context, id),
                        height: 200,
                        width: 300,
                      ),
                      actions: [
                        ElevatedButton(
                          child: Text("Ayarla"),
                          onPressed: () {
                            setAlertSnackBar(context, timeNappy);
                          },
                        ),
                      ],
                    );
                  }
                );
              } 
              else {
                alertSnackBar(context);
              }
            },
          ),
        ],
      ),
    );
  }

  Card babyFeed(BuildContext context,int id) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: switchFeed ==true ? Icon(MyIcons.milk_bottle, color: Colors.amber,size: 52,) : Icon(MyIcons.baby_bottle, color: Colors.purple.shade900,size: 52,),
            title: Text("Beslenme" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            subtitle: Text(formatDuration(timeFeed)+" Saat Sonra" ,style: TextStyle(fontSize: 18,)),
            trailing: Switch(
              activeColor: Colors.amber,
              value: switchFeed, 
              onChanged: (veri){
                setState(() {
                  switchFeed=veri;
                });
                print(veri);
                if (veri) {
                  final hours=twoDigits(timeFeed.inHours);
                  final minutes=twoDigits(timeFeed.inMinutes.remainder(60));
                  noti.notifyFeed(int.parse(hours),int.parse(minutes));
                } else {
                  inactiveReminder("feedYear");
                  noti.notifyCancel(102);
                }
              }
            ),
            onTap: (){
              if (!switchFeed) {
                showDialog( context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Kaç Dakika Sonra?"),
                    content: Container(
                      child:timePicker(context,id),
                      height:200,
                      width:300,
                    ),
                    actions: [
                      ElevatedButton(
                        child: Text("Ayarla"),
                        onPressed: (){
                          setAlertSnackBar(context, timeFeed);
                        },
                      ),
                    ],
                  );
                } 
              );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Zamanı Ayarlamak İçin Bildirimi Kapatmalısınız.")));
              }
            },
          ),
        ],
      ),
    );
  }

  Card babySleep(BuildContext context,int id) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: switchSleep ==true ? Icon(MyIconsMoon.cloud_moon, color: Colors.amber,size: 52,) : Icon(MyIconsMoon.cloud_moon_inv, color: Colors.purple.shade900,size: 52,),
            title: Text("Uyku" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            subtitle: Text(formatDuration(timeSleep)+" Saat Sonra" ,style: TextStyle(fontSize: 18,)),
            trailing: Switch(
              activeColor: Colors.amber,
              value: switchSleep, 
              onChanged: (veri){
                setState(() {
                  switchSleep=veri;
                });
                print(veri);
                if (veri) {
                  final hours=twoDigits(timeSleep.inHours);
                  final minutes=twoDigits(timeSleep.inMinutes.remainder(60));
                  noti.notifySleep(int.parse(hours),int.parse(minutes));
                } else {
                  inactiveReminder("sleepYear");
                  noti.notifyCancel(103);
                }
              }
            ),
            onTap: (){
              if (!switchSleep) {
                showDialog( context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Kaç Dakika Sonra?"),
                    content: Container(
                      child:timePicker(context,id),
                      height:200,
                      width:300,
                    ),
                    actions: [
                      ElevatedButton(
                        child: Text("Ayarla"),
                        onPressed: (){
                          setAlertSnackBar(context, timeSleep);
                        },
                      ),
                    ],
                  );
                } 
              );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Zamanı Ayarlamak İçin Bildirimi Kapatmalısınız.")));
              }
            },
          ),
        ],
      ),
    );
  }

  Card babyMedicine(BuildContext context,int id) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: switchMedicine ==true ? Icon(MyIcons.pill, color: Colors.amber,size: 52,) : Icon(MyIcons.syrup, color: Colors.purple.shade900,size: 52,),
            title: Text("İlaç" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            subtitle: Text(formatDuration(timeMedicine)+" Saat Sonra" ,style: TextStyle(fontSize: 18,)),
            trailing: Switch(
              activeColor: Colors.amber,
              value: switchMedicine, 
              onChanged: (veri){
                setState(() {
                  switchMedicine=veri;
                });
                print(veri);
                if (veri) {
                  final hours=twoDigits(timeMedicine.inHours);
                  final minutes=twoDigits(timeMedicine.inMinutes.remainder(60));
                  noti.notifyMedicine(int.parse(hours),int.parse(minutes));
                } else {
                  inactiveReminder("medicineYear");
                  noti.notifyCancel(104);
                }
              }
            ),
            onTap: (){
              if (!switchMedicine) {
                showDialog( context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Kaç Dakika Sonra?"),
                    content: Container(
                      child:timePicker(context,id),
                      height:200,
                      width:300,
                    ),
                    actions: [
                      ElevatedButton(
                        child: Text("Ayarla"),
                        onPressed: (){
                          setAlertSnackBar(context, timeMedicine);
                        },
                      ),
                    ],
                  );
                } 
              );
              } else {
                alertSnackBar(context);
              }
            },
          ),
        ],
      ),
    );
  }

  Card babySize(BuildContext context,int id) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: switchSize ==true ? Icon(MyIcons.ruler, color: Colors.amber,size: 52,) : Icon(MyIcons.height, color: Colors.purple.shade900,size: 52,),
            title: Text("Ölçüm" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            subtitle: Text(formatDuration(timeSize)+" Saat Sonra" ,style: TextStyle(fontSize: 18,)),
            trailing: Switch(
              activeColor: Colors.amber,
              value: switchSize, 
              onChanged: (veri){
                setState(() {
                  switchSize=veri;
                });
                print(veri);
                if (veri) {
                  final hours=twoDigits(timeSize.inHours);
                  final minutes=twoDigits(timeSize.inMinutes.remainder(60));
                  noti.notifySize(int.parse(hours),int.parse(minutes));
                } else {
                  inactiveReminder("sizeYear");
                  noti.notifyCancel(105);
                }
              }
            ),
            onTap: (){
              if (!switchSize) {
                showDialog( context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Kaç Dakika Sonra?"),
                    content: Container(
                      child:timePicker(context,id),
                      height:200,
                      width:300,
                    ),
                    actions: [
                      ElevatedButton(
                        child: Text("Ayarla"),
                        onPressed: (){
                          setAlertSnackBar(context, timeSize);
                        },
                      ),
                    ],
                  );
                } 
              );
              } else {
                alertSnackBar(context);
              }
            },
          ),
        ],
      ),
    );
  }

  Card babyCustom(BuildContext context,int id) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: switchCustom ==true ? Icon(MyIcons.ringon, color: Colors.amber,size: 52,) : Icon(MyIcons.ring, color: Colors.purple.shade900,size: 52,),
            title: Text("Bildirim Oluştur" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            subtitle: Text(formatDuration(timeCustom)+" Saat Sonra\n$customNotifyMessage" ,style: TextStyle(fontSize: 18,)),
            isThreeLine: true,
            trailing: Switch(
              activeColor: Colors.amber,
              value: switchCustom, 
              onChanged: (veri){
                setState(() {
                  switchCustom=veri;
                });
                print(veri);
                if (veri) {
                  final hours=twoDigits(timeCustom.inHours);
                  final minutes=twoDigits(timeCustom.inMinutes.remainder(60));
                  noti.notifyCustom(int.parse(hours),int.parse(minutes),customNotifyMessage);
                } else {
                  inactiveReminder("CustomYear");
                  noti.notifyCancel(106);
                }
              }
            ),
            onTap: (){
              if (!switchCustom) {
                showDialog( context: context, builder: (context){
                  return GestureDetector(
                    onTap: (){
                      FocusScope.of(context).unfocus();
                    },
                    child: AlertDialog(
                      title: Text("Kaç Dakika Sonra?"),
                      content: Container(
                        child:timePicker(context,id),
                        height:200,
                        width:300,
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: tfControllerMessage,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.left,
                            maxLength: 30,
                            decoration: InputDecoration(
                              hintText: "Bildirim Mesajınız",
                              labelText: "Mesaj",
                            ),
                          ),
                        ),
                        ElevatedButton(
                          child: Text("Ayarla"),
                          onPressed: (){
                            customNotifyMessage=tfControllerMessage.text;
                            setAlertSnackBar(context, timeCustom);
                          },
                        ),
                      ],
                    ),
                  );
                } 
              );
              } else {
                alertSnackBar(context);
              }
            },
          ),
        ],
      ),
    );
  }

  void alertSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Zamanı Ayarlamak İçin Bildirimi Kapatmalısınız.")));
  }

  void setAlertSnackBar(BuildContext context, Duration duration) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(formatDuration(duration) + " Saat sonra'ya ayarlandı.")));
    setState(() {});
    Navigator.pop(context);
  }

  Widget timePicker(BuildContext context,int id){
    return CupertinoTimerPicker(
      initialTimerDuration: duration,
      mode: CupertinoTimerPickerMode.hm,
      minuteInterval: 1,  
      onTimerDurationChanged: (value){
        switch (id) {
          case 1: this.timeNappy=value; break;
          case 2: this.timeFeed=value; break;
          case 3: this.timeSleep=value; break;
          case 4: this.timeMedicine=value; break;
          case 5: this.timeSize=value; break;
          case 6: this.timeCustom=value; break;
          default: return;
        }
      }
    );
  }

  Future<void> checkReminders(int notifyCancelId,bool switchName,Duration timeDurationName,String spYearName,String spMonthName,String spDayName,String spHourName,String spMinuteName,String spSecondName) async{
    var sp= await SharedPreferences.getInstance();
    int year=sp.getInt(spYearName) ?? 1;
    int month=sp.getInt(spMonthName) ?? 1;
    int day=sp.getInt(spDayName) ?? 1;
    int H= sp.getInt(spHourName) ?? 1;
    int M= sp.getInt(spMinuteName) ?? 1;
    int S= sp.getInt(spSecondName) ?? 1;
    var now=DateTime.now();
    var scheduleTime=tz.TZDateTime(tz.local, year, month, day, H, M, S);
    var left=tz.TZDateTime(tz.local, year-now.year, month-now.month, day-now.day, H-now.hour,M-now.minute,S-now.second);
    if (now.isBefore(scheduleTime)) {
      
      setState(() {
        switchName=true;
      });
      timeDurationName=Duration(hours: left.hour, minutes: left.minute);
      setState(() {});
    }
    else{
      switchName=true;
      noti.notifyCancel(notifyCancelId);
    }
  }

  Future<void> inactiveReminder(String spReminderYear) async{
    var sp= await SharedPreferences.getInstance();
    sp.remove(spReminderYear);
  }

  Widget shimmerEffect(){
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300, 
      highlightColor: Colors.grey.shade400,
      child: Card(), 
    );
  }

}