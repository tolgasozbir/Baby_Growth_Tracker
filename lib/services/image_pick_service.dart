import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/locale_keys.g.dart';
import '../widgets/locale_text.dart';

class ImagePickService {
  ImagePickService._();
  static ImagePickService? _instance;
  static ImagePickService get instance => _instance ??= ImagePickService._();

  final ImagePicker _imagePicker = ImagePicker();

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
    return Platform.isIOS ? iosView(context) : androidView(context);
  }

  Future<ImageSource?> iosView(BuildContext context) {
    return showCupertinoModalPopup<ImageSource>(
      context: context, 
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(ImageSource.camera), 
            child: const LocaleText(text: LocaleKeys.common_camera),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(ImageSource.gallery), 
            child: const LocaleText(text: LocaleKeys.common_gallery),
          ),
        ],
      )
    );
  }

  Future<ImageSource?> androidView(BuildContext context) {
    return showModalBottomSheet<ImageSource>(
      context: context, 
      builder: (context)=> Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const LocaleText(text: LocaleKeys.common_camera),
            onTap: () => Navigator.of(context).pop(ImageSource.camera),
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const LocaleText(text: LocaleKeys.common_gallery),
            onTap: () => Navigator.of(context).pop(ImageSource.gallery),
          )
        ],
      )
    );
  }

}