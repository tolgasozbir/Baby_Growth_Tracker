import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/locale_keys.g.dart';
import '../widgets/locale_text.dart';

class ImagePickService {
  ImagePickService._();
  static ImagePickService? _instance;
  static ImagePickService get instance => _instance ??= ImagePickService._();

  final _imagePicker = ImagePicker();
  final _cropper = ImageCropper();

  Future<String?> pick(ImageSource source) async {
    try {
      final XFile? pickedImage =  await _imagePicker.pickImage(source: source);
      if (pickedImage == null) return null;

      var croppedImage = await _cropper.cropImage(
        sourcePath: pickedImage.path,
        uiSettings: [
          AndroidUiSettings(lockAspectRatio: false,),
          IOSUiSettings(aspectRatioLockEnabled: false),
        ],
        compressQuality: 80,
      );
      if (croppedImage == null) return null;

      return croppedImage.path;
    } on PlatformException catch (e) {
      print("Image not selected $e");
      return null;
    }
  }

  Future<List<String>> pickMultiple() async {
    try {
      final List<XFile> pickedImages =  await _imagePicker.pickMultiImage();
      return pickedImages.map((e) => e.path).toList();
    } on PlatformException catch (e) {
      print("Image not selected $e");
      return [];
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