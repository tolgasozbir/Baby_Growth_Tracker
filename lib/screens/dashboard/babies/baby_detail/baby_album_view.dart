import 'dart:io';

import 'package:baby_growth_tracker/constants/app_styles.dart';
import 'package:baby_growth_tracker/extensions/context_extension.dart';
import 'package:baby_growth_tracker/models/baby.dart';
import 'package:baby_growth_tracker/widgets/locale_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../constants/app_strings.dart';
import 'baby_album_view_model.dart';

class BabyDetailView extends StatefulWidget {
  const BabyDetailView({super.key, required this.baby});

  final Baby baby;

  @override
  State<BabyDetailView> createState() => _BabyDetailViewState();
}

class _BabyDetailViewState extends BabyAlbumViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: fab(context),
      body: bodyView(),
    );
  }

  FloatingActionButton fab(BuildContext context) {
    return FloatingActionButton(
      onPressed: fabBtnFn,
      child: const Icon(Icons.add_photo_alternate_outlined),
    );
  }

  Widget bodyView() {
    return Padding(
      padding: AppPaddings.paddingAll8,
      child: SingleChildScrollView(
        child: Column(
          children: [
            profilePic(),
            babyName(),
            albumGrid(),
          ],
        ),
      ),
    );
  }

  CircleAvatar profilePic() {
    return CircleAvatar(
      radius: profilePicRadius,
      backgroundColor: context.colorScheme.primary,
      child: Padding(
        padding: AppPaddings.paddingAll4,
        child: ClipOval(
          child: widget.baby.profileImage == null 
            ? Image.asset(
                AppStrings.defaultBabyImage, 
                fit: BoxFit.cover,
                height: profilePicRadius * 2,
              )
            : Image.file(
                File(widget.baby.profileImage!),
                errorBuilder: (context, error, stackTrace) => notFoundIcon(),
              ),
        ),
      ),
    );
  }

  Icon notFoundIcon() => const Icon(Icons.error_outline);

  LocaleText babyName() {
    return LocaleText(
      withOutLocale: true,
      text: widget.baby.name, 
      style: AppTextStyles.h3.copyWith(
        color: context.colorScheme.primary, 
        fontWeight: FontWeight.bold
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget albumGrid() {
    return AnimationLimiter(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: albumGridCrossAxisCount,
          childAspectRatio: albumGridAspecRatio,
        ),
        itemCount: albumGridItemCount,
        itemBuilder: (BuildContext context, int index) => AnimationConfiguration.staggeredGrid(
          position: index,
          columnCount: albumGridCrossAxisCount,
          duration: gridAnimationDuration,
          child: SlideAnimation(
            child: FadeInAnimation(
              child: albumCard(index),
            ),
          ),
        ),
      ),
    );
  }

  Card albumCard(int index) {
    return Card(
      elevation: 2,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: index < (widget.baby.photoAlbum.length) 
      ? filledImage(index)
      : emptyImage(),
    );
  }

  GestureDetector filledImage(int index) {
    return GestureDetector(
      onTap: () async => await onTapImageCardFn(
        imageIndex: index, 
        imageWidget: image(index)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: image(index),
      ),
    );
  }

  Image image(int index) {
    return Image.file(
      File(widget.baby.photoAlbum[index]), 
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => notFoundIcon(),
    );
  }

  Icon emptyImage() {
    return const Icon(
      Icons.image_outlined, 
      color: Colors.black45,
      size: 48,
    );
  }

}