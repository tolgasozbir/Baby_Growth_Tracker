import 'dart:io';

import 'package:baby_growth_tracker/constants/app_styles.dart';
import 'package:baby_growth_tracker/models/baby.dart';
import 'package:baby_growth_tracker/services/image_pick_service.dart';
import 'package:baby_growth_tracker/widgets/locale_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_strings.dart';
import '../../../../providers/babies_provider.dart';

class BabyDetailView extends StatelessWidget {
  const BabyDetailView({super.key, required this.baby});

  final Baby baby;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: fab(context),
      body: bodyView(),
    );
  }

  FloatingActionButton fab(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add_photo_alternate_outlined),
      onPressed: () async {
        var pickedImages = await ImagePickService.instance.pickMultiple();
        baby.photoAlbum.addAll(pickedImages);
        await context.read<BabiesProvider>().saveToCache();
        //TODO: didnt refresh idk update extension yaz
      }
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
      radius: 64,
      backgroundColor: const Color(0xFF3D3082),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ClipOval(  
          child: baby.profileImage == null 
            ? Image.asset(AppStrings.defaultBabyImage)
            : Image.file(File(baby.profileImage!))
        ),
      ),
    );
  }

  LocaleText babyName() {
    return LocaleText(
      withOutLocale: true,
      text: baby.name, 
      style: AppTextStyles.h3.copyWith(color: const Color(0xFF3D3082), fontWeight: FontWeight.bold),
      overflow: TextOverflow.ellipsis,
    );
  }

  GridView albumGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1/1,
      ),
      itemCount: 99,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 2,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: index < (baby.photoAlbum.length) 
          ? ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.file(
                File(baby.photoAlbum[index]), 
                fit: BoxFit.cover,
              ),
            )
          : const Icon(
              Icons.image_outlined, 
              color: Colors.black45,
              size: 48,
            ),
        );
      },
    );
  }
}