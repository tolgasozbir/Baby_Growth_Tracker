import 'dart:convert';

import 'package:baby_growth_tracker/constants/app_styles.dart';
import 'package:baby_growth_tracker/extensions/context_extension.dart';
import 'package:baby_growth_tracker/extensions/widget_extension.dart';
import 'package:baby_growth_tracker/services/image_pick_service.dart';
import 'package:baby_growth_tracker/widgets/app_text_form_field.dart';
import 'package:baby_growth_tracker/widgets/bordered_button.dart';
import 'package:baby_growth_tracker/widgets/gender_select.dart';
import 'package:flutter/material.dart';
import '../../../widgets/age_horizontal_list_wheel.dart';

class AddBabyView extends StatefulWidget {
  const AddBabyView({super.key});

  @override
  State<AddBabyView> createState() => _AddBabyViewState();
}

class _AddBabyViewState extends State<AddBabyView> {

  String? pickedImageBase64;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: _bodyView()
    );
  }

  SingleChildScrollView _bodyView() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          babyImageCard(),
          addBabyForm(),
        ],
      ),
    );
  }

  Widget babyImageCard() {
    return SizedBox(
        height: context.dynamicWidth(0.44),
        width: context.dynamicWidth(0.64),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              circleImage(),
              addPhotoButton(),
            ],
          ),
        ),
      );
  }

  Widget circleImage() {
    return SizedBox.square(
      dimension: context.dynamicHeight(0.14),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: context.colorScheme.primary, width: 3.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: pickedImageBase64 == null 
              ? AssetImage("assets/images/img_default_baby.jpg")
              : MemoryImage(base64Decode(pickedImageBase64!)) as ImageProvider
          )
        ),
      ),
    ).wrapPadding(AppPadding.padding12);
  }

  BorderedButton addPhotoButton() {
    return BorderedButton(
      padding: EdgeInsets.zero,
      child: Text("Fotoğraf Ekle", style: AppTextStyle.h6Regular.copyWith(color: context.colorScheme.primary)), 
      onPressed: () async {
        final picker = ImagePickService.instance;
        final pickSource = await picker.showImageSource(context);
        if (pickSource != null) {
          pickedImageBase64 = await picker.pick(pickSource);
          setState(() { });
        }
      },
    );
  }

  Widget addBabyForm() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        children: [
          Column(
            children: [
              AppTextFormField(labelText: "Name",).wrapPadding(AppPadding.padding8),
              AgeHorizontalListWheel(selectedItem: (int value) => print(value)),
              GenderSelect(onChanged: (Gender gender) => print(gender),),
              saveButton(),
            ],
          ),
        ],
      ),
    ).wrapPadding(AppPadding.padding8);
  }

  BorderedButton saveButton() {
    return BorderedButton(
      btnWidth: context.dynamicWidth(0.56),
      backgroundColor: context.colorScheme.primary,
      borderColor: context.colorScheme.onPrimary,
      splashColor: context.colorScheme.onPrimary,
      borderWidth: 2,
      child: Text("Ekle", style: AppTextStyle.h4Regular.copyWith(color: context.colorScheme.onSecondary)), 
      onPressed: () => null,
    );
  }

}