
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show Platform;
// ignore: import_of_legacy_library_into_null_safe
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class LocalNotifyManager {

  Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();
  final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(currentTimeZone));
}

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var initSetting;
  BehaviorSubject<ReceiveNotification> get didReceiveNotificationSubject =>
  BehaviorSubject<ReceiveNotification>();

  LocalNotifyManager.init(){
    flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      requestIOSPermission();
      
    }
    initializePlatform();
  }

  requestIOSPermission(){
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()!.
    requestPermissions(
      alert: true,
      badge: true,
      sound: true,
      );
  }

  initializePlatform(){
    _configureLocalTimeZone();
    var initSettingAndroid=AndroidInitializationSettings("@mipmap/ic_launcher");
    var initSettingIOS=IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id,title,body,payLoad) async{
        ReceiveNotification notification = ReceiveNotification(id, title!, body!, payLoad!);
        didReceiveNotificationSubject.add(notification);
      }
    );
    initSetting=InitializationSettings(android: initSettingAndroid,iOS: initSettingIOS);
  }


  void setOnNotificationReceive(Function onNotificationReceive){
    didReceiveNotificationSubject.listen((notification) {
      onNotificationReceive(notification);
    });
  }

  
  setOnNotificationClick(Function onNotificationClick) async{
    await flutterLocalNotificationsPlugin.initialize(initSetting,
    onSelectNotification: (String? payload) async{
      onNotificationClick(payload);
    } );
  }

  ///////////////////////////////       Notifications       /////////////////////////////////////////////

  NotificationDetails platformDetail() {
    var androidChannel=AndroidNotificationDetails(
      'CHANNEL_ID',
      'CHANNEL_NAME',
      'CHANNEL_DESC',
      color: Colors.amber,
      importance: Importance.max,
      priority: Priority.high,
    );
    var iosChannel=IOSNotificationDetails();
    var platformChannel=NotificationDetails(android: androidChannel,iOS: iosChannel);
    return platformChannel;
  }

  Future<void> notifyCancel(int id) async{
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> notifyNappy(int hour,int minute) async{
    var cal=(hour*60)+minute;
    if (cal==0) cal=1;
    var time=tz.TZDateTime.now(tz.local).add(Duration(minutes: cal));
    print("${time.hour}:${time.minute}:${time.second} Saatine Bildirim Gönderlicek" );
    veriKayitNappy(time.year,time.month,time.day,time.hour,time.minute,time.second);
    NotificationDetails platformChannel = platformDetail();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      101, 
      "Bez Değiştirmeyi Unutma!",   //heyy bezimi değiştirmeyi unuttun : title --- gel buraya ve bezimi kontrol et ıslanmışsa değiştir -- sanki bebeğin ağzından gibi
      "Bebeğiniz altını ıslatmış olabilir. Kontrol etmeyi unutmayın!", // random mesajlardan çeksin 3 5 farklı mesaj olsun 
      time,
      platformChannel,
      uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  Future<void> notifyFeed(int hour,int minute) async{
    var cal=(hour*60)+minute;
    if (cal==0) cal=1;
     var time=tz.TZDateTime.now(tz.local).add(Duration(minutes: cal));
    print("${time.hour}:${time.minute}:${time.second} Saatine Bildirim Gönderlicek" );
    veriKayitFeed(time.year,time.month,time.day,time.hour,time.minute,time.second);
    NotificationDetails platformChannel = platformDetail();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      102, 
      "Besle Beni!", 
      "O da ne? Açıkmış bir bebeğin seslerini duyuyor gibiyim. Kontrol etsen iyi olur. :)", 
      time,
      platformChannel,
      uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      );
  }

  Future<void> notifySleep(int hour,int minute) async{
    var cal=(hour*60)+minute;
    if (cal==0) cal=1;
     var time=tz.TZDateTime.now(tz.local).add(Duration(minutes: cal));
    print("${time.hour}:${time.minute}:${time.second} Saatine Bildirim Gönderlicek" );
    veriKayitSleep(time.year,time.month,time.day,time.hour,time.minute,time.second);
    NotificationDetails platformChannel = platformDetail();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      103, 
      "Uyku Vakti Geldi!", 
      "Uyuma vakti geldi, hadi biraz uyuyalım.", 
      time,
      platformChannel,
      uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      );
  }

  Future<void> notifyMedicine(int hour,int minute) async{
    var cal=(hour*60)+minute;
    if (cal==0) cal=1;
     var time=tz.TZDateTime.now(tz.local).add(Duration(minutes: cal));
    print("${time.hour}:${time.minute}:${time.second} Saatine Bildirim Gönderlicek" );
    veriKayitMedicine(time.year,time.month,time.day,time.hour,time.minute,time.second);
    NotificationDetails platformChannel = platformDetail();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      104, 
      "Sağlık Her şeyden önemli!", 
      "İlaç vakti geldi, vakit geçmeden ilaçları içirsen iyi olur!", 
      time,
      platformChannel,
      uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      );
  }

  Future<void> notifySize(int hour,int minute) async{
      var cal=(hour*60)+minute;
      if (cal==0) cal=1;
     var time=tz.TZDateTime.now(tz.local).add(Duration(minutes: cal));
    print("${time.hour}:${time.minute}:${time.second} Saatine Bildirim Gönderlicek" );
    veriKayitSize(time.year,time.month,time.day,time.hour,time.minute,time.second);
    NotificationDetails platformChannel = platformDetail();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      105, 
      "Büyüyoruz", 
      "Ölçüm zamanı gedi, bugün vücud ölçülerini alma vakti",
      time,
      platformChannel,
      uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      );
  }

  Future<void> notifyCustom(int hour,int minute,String message) async{
    var cal=(hour*60)+minute;
    if (cal==0) cal=1;
    var time=tz.TZDateTime.now(tz.local).add(Duration(minutes: cal));
    print("${time.hour}:${time.minute}:${time.second} Saatine Bildirim Gönderlicek" );
    veriKayitCustom(time.year,time.month,time.day,time.hour,time.minute,time.second,message);
    NotificationDetails platformChannel = platformDetail();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      106, 
      "Özel Bildirim", 
      message,
      time,
      platformChannel,
      uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      );
  }

  void veriKayitNappy(int year,int month, int day ,int h,int m, int s) async{
    var sp= await SharedPreferences.getInstance();
    sp.setInt("nappyYear", year);
    sp.setInt("nappyMonth", month);
    sp.setInt("nappyday", day);
    sp.setInt("nappyH", h);
    sp.setInt("nappyM", m);
    sp.setInt("nappyS", s);
    print("$year:$month:$day - $h:$m:$s Nappy süre kayit edildi");
  }

  void veriKayitFeed(int year,int month, int day ,int h,int m, int s) async{
    var sp= await SharedPreferences.getInstance();
    sp.setInt("feedYear", year);
    sp.setInt("feedMonth",month);
    sp.setInt("feedDay",day);
    sp.setInt("feedH", h);
    sp.setInt("feedM", m);
    sp.setInt("feedS", s);
    print("$year:$month:$day - $h:$m:$s Feed süre kayit edildi");
  }

  void veriKayitSleep(int year,int month, int day ,int h,int m, int s) async{
    var sp= await SharedPreferences.getInstance();
    sp.setInt("sleepYear", year);
    sp.setInt("sleepMonth",month);
    sp.setInt("sleepDay",day);
    sp.setInt("sleepH", h);
    sp.setInt("sleepM", m);
    sp.setInt("sleepS", s);
    print("$year:$month:$day - $h:$m:$s Sleep süre kayit edildi");
  }

  void veriKayitMedicine(int year,int month, int day ,int h,int m, int s) async{
    var sp= await SharedPreferences.getInstance();
    sp.setInt("medicineYear", year);
    sp.setInt("medicineMonth",month);
    sp.setInt("medicineDay",day);
    sp.setInt("medicineH", h);
    sp.setInt("medicineM", m);
    sp.setInt("medicineS", s);
    print("$year:$month:$day - $h:$m:$s Sleep süre kayit edildi");
  }

  void veriKayitSize(int year,int month, int day ,int h,int m, int s) async{
    var sp= await SharedPreferences.getInstance();
    sp.setInt("sizeYear", year);
    sp.setInt("sizeMonth",month);
    sp.setInt("sizeDay",day);
    sp.setInt("sizeH", h);
    sp.setInt("sizeM", m);
    sp.setInt("sizeS", s);
    print("$year:$month:$day - $h:$m:$s Sleep süre kayit edildi");
  }

  void veriKayitCustom(int year,int month, int day ,int h,int m, int s,String message) async{
    var sp= await SharedPreferences.getInstance();
    sp.setInt("customYear", year);
    sp.setInt("customMonth",month);
    sp.setInt("customDay",day);
    sp.setInt("customH", h);
    sp.setInt("customM", m);
    sp.setInt("customS", s);
    sp.setString("customMessage", message);
    print("$year:$month:$day - $h:$m:$s Sleep süre kayit edildi");
  }
  
}

LocalNotifyManager noti=LocalNotifyManager.init();

class ReceiveNotification {
  late final int id;
  late final String title;
  late final String body;
  late final String payLoad;

  ReceiveNotification(this.id,this.title,this.body,this.payLoad);
}