import 'dart:convert';

class Baby {
  final int id;
  final String name;
  final int age;
  final String gender;
  final String? image;
  final List<String>? photoAlbum;

  Baby({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    this.image,
    this.photoAlbum,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'img': image,
      'photoAlbum': photoAlbum,
    };
  }

  factory Baby.fromMap(Map<String, dynamic> map) {
    return Baby(
      id: map['id'] as int,
      name: map['name'] as String,
      age: map['age'] as int,
      gender: map['gender'] as String,
      image: map['img'] != null ? map['img'] as String : null,
      photoAlbum: map['photoAlbum'] != null ? List<String>.from((map['photoAlbum'] as List<String>)) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Baby.fromJson(String source) => Baby.fromMap(json.decode(source) as Map<String, dynamic>);
}
