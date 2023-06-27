import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'base_model.dart';

@immutable
class Baby extends IBaseModel<Baby> {
  final int id;
  final String name;
  final int age;
  final String gender;
  final String? profileImage;
  final List<String>? photoAlbum;

  Baby({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    this.profileImage,
    this.photoAlbum,
  });

  factory Baby.fromMap(Map<String, dynamic> map) {
    return Baby(
      id: map['id'] as int,
      name: map['name'] as String,
      age: map['age'] as int,
      gender: map['gender'] as String,
      profileImage: map['profileImage'] != null ? map['profileImage'] as String : null,
      photoAlbum: map['photoAlbum'] != null ? List<String>.from((map['photoAlbum'] as List<String>)) : null,
    );
  }

  factory Baby.fromJson(String source) => Baby.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  @override
  Baby fromMap(Map<String, dynamic> map) {
    return Baby.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'age': age,
    'gender': gender,
    'profileImage': profileImage,
    'photoAlbum': photoAlbum,
  };
  
}
