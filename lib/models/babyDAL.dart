import 'package:baby_growth_tracker/models/babyData.dart';
import 'package:baby_growth_tracker/models/dbInstaller.dart';
import 'package:baby_growth_tracker/models/baby.dart';
import 'package:baby_growth_tracker/models/diary.dart';
import 'package:baby_growth_tracker/models/memory.dart';

class BabyDal {

  ///////////////////////Babies/////////////////////

  Future<List<Baby>> getAll() async{
    var db=await DatabaseInstaller.databaseAccess();

    List<Map<String,dynamic>> maps=await db.rawQuery("select * from babies");

    return List.generate(maps.length, (index) {

      var val = maps[index];

      return Baby(val["babyId"], val["babyName"], val["babyAge"], val["babyGender"], val["babyImage"]);

    });
  }

  Future<void> addBaby(String name,int age,String gender,String imgPath) async{
    var db=await DatabaseInstaller.databaseAccess();

    var values=Map<String,dynamic>();

    values["babyName"]=name;
    values["babyAge"]=age;
    values["babyGender"]=gender;
    values["babyImage"]=imgPath;

    await db.insert("babies", values);

  }

    Future<void> addBabyWithOutImg(String name,int age,String gender) async{
    var db=await DatabaseInstaller.databaseAccess();

    var values=Map<String,dynamic>();

    values["babyName"]=name;
    values["babyAge"]=age;
    values["babyGender"]=gender;

    await db.insert("babies", values);

  }

  Future<void> deleteBaby(int id) async{
    var db=await DatabaseInstaller.databaseAccess();

    await db.delete("babies",where: "babyId = ?", whereArgs: [id]);
  }

///////////////////////////////////// Memories ///////////////////////////////////

  Future<List<Memory>> getAllMemories() async{
    var db=await DatabaseInstaller.databaseAccess();

    List<Map<String,dynamic>> maps=await db.rawQuery("select * from memories");

    return List.generate(maps.length, (index) {
      
      var val = maps[index];

      return Memory(val["memoryId"], val["memoryContent"], val["memoryDate"], val["memoryTitle"], val["memoryPic"],);

    });
  }

  Future<void> addMemory(String memory,String title,String date,String image) async{
    var db=await DatabaseInstaller.databaseAccess();

    var values=Map<String,dynamic>();

    values["memoryContent"]=memory;
    values["memoryTitle"]=date;
    values["memoryDate"]=title;
    values["memoryPic"]=image;

    await db.insert("memories", values);
  }

  Future<void> updateMemory(int id,String memory,String title,String date) async{
    var db=await DatabaseInstaller.databaseAccess();

    var values=Map<String,dynamic>();

    values["memoryContent"]=memory;
    values["memoryTitle"]=title;
    values["memoryDate"]=date;

    await db.update("memories", values,where: "memoryId=?",whereArgs: [id]);
  }

  Future<void> deleteMemory(int id) async{
    var db=await DatabaseInstaller.databaseAccess();
    await db.delete("memories",where: "memoryId = ?", whereArgs: [id]);
  }

  ////////////////////  Diaries   ////////////////////////////////////

  Future<List<Diary>> getAllDiaries() async{
    var db=await DatabaseInstaller.databaseAccess();

    List<Map<String,dynamic>> maps=await db.rawQuery("select * from diaries");

    return List.generate(maps.length, (index) {
      
      var val = maps[index];

      return Diary(val["diaryId"], val["diary"], val["diaryDate"]);

    });
  }

  Future<void> addDiary(String diary,String date) async{
    var db=await DatabaseInstaller.databaseAccess();

    var values=Map<String,dynamic>();

    values["diary"]=diary;
    values["diaryDate"]=date;

    await db.insert("diaries", values);
  }

  Future<void> updateDiary(int id,String diary,String date) async{
    var db=await DatabaseInstaller.databaseAccess();

    var values=Map<String,dynamic>();

    values["diary"]=diary;
    values["diaryDate"]=date;

    await db.update("diaries", values,where: "diaryId=?",whereArgs: [id]);
  }

  Future<void> deleteDairy(int id) async{
    var db=await DatabaseInstaller.databaseAccess();

    await db.delete("diaries",where: "diaryId = ?", whereArgs: [id]);
  }

  /////////////////////// babySize LineChart ///////////////////////
  
  Future<List<BabySize>> getBabyData() async{
    var db=await DatabaseInstaller.databaseAccess();

    List<Map<String,dynamic>> maps=await db.rawQuery("SELECT * from babySize,babies WHERE babySize.babyIdForeign = babies.babyId");

    return List.generate(maps.length, (index) {
      
      var val = maps[index];

      var baby=Baby(val["babyId"], val["babyName"], val["babyAge"], val["babyGender"], val["babyImage"]);
      var size=BabySize(val["id"], val["height"], val["weight"],val["babyId"],baby);

      return size;

    });
  }

    Future<void> addChartData(double height,double weight, int babyId) async{
    var db=await DatabaseInstaller.databaseAccess();

    var values=Map<String,dynamic>();

    values["height"]=height;
    values["weight"]=weight;
    values["babyIdForeign"]=babyId; //babyId

    await db.insert("babySize", values);
  }

  Future<void> deleteChartData(int id) async{
    var db=await DatabaseInstaller.databaseAccess();

    await db.delete("babySize",where: "id = ?", whereArgs: [id]);
  }








  
}