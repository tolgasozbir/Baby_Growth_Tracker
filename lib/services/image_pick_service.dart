import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickService {
  ImagePickService._();
  static ImagePickService? _instance;
  static ImagePickService get instance => _instance ??= ImagePickService._();

  ImagePicker _imagePicker = ImagePicker();

  Future<String?> pick(ImageSource source) async {
    try {
      final PickedFile? pickedImage = await _imagePicker.getImage(source: source);
      if (pickedImage == null) return null;
      return base64Encode(await pickedImage.readAsBytes());
    } on PlatformException catch (e) {
      print("Resim Seçilemedi $e");
      return null;
    }
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    return Platform.isIOS ? _IosView(context) : _androidView(context);
  }

  Future<ImageSource?> _IosView(BuildContext context) {
    return showCupertinoModalPopup<ImageSource>(
      context: context, 
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(ImageSource.camera), 
            child: Text("kamera")
          ),          
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(ImageSource.gallery), 
            child: Text("galeri")
          ),
        ],
      )
    );
  }

  Future<ImageSource?> _androidView(BuildContext context) {
    return showModalBottomSheet<ImageSource>(
      context: context, 
      builder: (context)=> Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text("kamera"),
            onTap: () => Navigator.of(context).pop(ImageSource.camera),
          ),      
          ListTile(
            leading: Icon(Icons.image),
            title: Text("galeri"),
            onTap: () => Navigator.of(context).pop(ImageSource.gallery),
          )
        ],
      )
    );
  }

}