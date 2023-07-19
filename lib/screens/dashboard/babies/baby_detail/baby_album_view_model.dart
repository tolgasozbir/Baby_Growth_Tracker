import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../mixins/screen_updater_mixin.dart';
import '../../../../providers/babies_provider.dart';
import '../../../../services/image_pick_service.dart';
import 'baby_album_view.dart';
import '../../../../widgets/dialogs/enlarge_image_dialog.dart';

abstract class BabyAlbumViewModel extends State<BabyDetailView> with ScreenUpdaterMixin {

  final profilePicRadius = 64.0;
  final albumGridCrossAxisCount = 3;
  final albumGridAspecRatio = 1/1;
  final albumGridItemCount = 99;
  final gridAnimationDuration = const Duration(milliseconds: 1200);

  @override
  void initState() {
    super.initState();
  }

  void fabBtnFn() async {
    if (widget.baby.photoAlbum.length == albumGridItemCount) {
      return;
      //TODO: Snackbar
    }
    var pickedImages = await ImagePickService.instance.pickMultiple();
    widget.baby.photoAlbum.addAll(pickedImages);
    await context.read<BabiesProvider>().saveToCache();
    updateScreen();
  }

  Future<void> onTapImageCardFn({required int imageIndex, required Widget imageWidget}) async {
    bool? deleteImage = await showEnlargedImage(context, imageWidget);
    if (deleteImage == true) {
      widget.baby.photoAlbum.removeAt(imageIndex);
      await context.read<BabiesProvider>().saveToCache();
      updateScreen();
    }
  }
  
}