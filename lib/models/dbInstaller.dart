import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';

class DatabaseInstaller {

  static final String databaseName="babyTrackDb.sqlite";

  static Future<Database> databaseAccess() async{
    String databasePath=join(await getDatabasesPath(),databaseName);

    if (await databaseExists(databasePath)) {
      print("Database Yüklü");
    }else{
      ByteData data =await rootBundle.load("database/$databaseName");
      List<int> bytes =data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(databasePath).writeAsBytes(bytes,flush:true);
    }

    return openDatabase(databasePath);

  }
  
}