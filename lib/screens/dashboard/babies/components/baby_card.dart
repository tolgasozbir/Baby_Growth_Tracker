import 'dart:io';

import 'package:baby_growth_tracker/constants/app_strings.dart';
import 'package:baby_growth_tracker/constants/locale_keys.g.dart';
import 'package:baby_growth_tracker/screens/dashboard/babies/components/wave_painter.dart';
import 'package:flutter/material.dart';
import 'package:baby_growth_tracker/models/baby.dart';

import '../../../../constants/app_styles.dart';
import '../../../../widgets/locale_text.dart';

class BabyCard extends StatelessWidget {
  const BabyCard({super.key, required this.baby});

  final Baby baby;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox(
        height: 140,
        child: Card(
          color: const Color(0xFFF4F4F7),
          elevation: 4,
          child: CustomPaint(
            painter: WavePainter(),
            child: Row(
              children: [
                circleAvatar(),
                babyInfo(baby),
                genderAndArrowIcon(baby.gender),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded circleAvatar() {
    return Expanded(
      flex: 1,
      child: CircleAvatar(
        radius: 42,
        backgroundColor: const Color(0xFF3D3082),
        child: CircleAvatar(
          radius: 40,
          backgroundImage: baby.profileImage == null 
            ? AssetImage(AppAssets.defaultBabyImage.path)
            : FileImage(File(baby.profileImage!)) as ImageProvider
        ),
      ),
    );
  }

  Expanded babyInfo(Baby baby) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocaleText(
            withOutLocale: true,
            text: baby.name, 
            style: AppTextStyles.h3.copyWith(color: const Color(0xFF3D3082), fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          LocaleText(
            args: ["${baby.age}"],
            text: LocaleKeys.child_yearsOld,
            style: AppTextStyles.h4.copyWith(color: Colors.black45),
          ), 
        ],
      ),
    );
  }

  Column genderAndArrowIcon(String gender) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.male, color: Color(0xffAAAAAA), size: 56,),
        Icon(Icons.chevron_right, color: Color(0xFF3D3082), size: 56,),
      ],
    );
  }
  
}