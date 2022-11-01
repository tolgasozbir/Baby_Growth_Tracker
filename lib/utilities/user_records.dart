import 'package:baby_growth_tracker/models/baby.dart';

class UserRecords {
  UserRecords._();
  static UserRecords _instance = UserRecords._();
  static UserRecords get instance => _instance;

  List<Baby> _babyList = [
    Baby(id: 1, name: "muhammetefsdsa", age: 1, gender: "Erkek"),
    Baby(id: 2, name: "abcde", age: 3, gender: "Kız"),
    Baby(id: 3, name: "asdas", age: 2, gender: "Kız"),
    Baby(id: 3, name: "asdas", age: 2, gender: "Kız"),
  ];

  List<Baby> get babyList => _babyList;
}