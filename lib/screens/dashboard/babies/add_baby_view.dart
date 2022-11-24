import 'dart:convert';
import 'package:baby_growth_tracker/constants/app_styles.dart';
import 'package:baby_growth_tracker/extensions/context_extension.dart';
import 'package:baby_growth_tracker/extensions/widget_extension.dart';
import 'package:baby_growth_tracker/models/baby.dart';
import 'package:baby_growth_tracker/services/image_pick_service.dart';
import 'package:baby_growth_tracker/utilities/input_validation_mixin.dart';
import 'package:baby_growth_tracker/utilities/user_records.dart';
import 'package:baby_growth_tracker/widgets/app_text_form_field.dart';
import 'package:baby_growth_tracker/widgets/bordered_button.dart';
import 'package:baby_growth_tracker/widgets/gender_select.dart';
import 'package:baby_growth_tracker/widgets/space_box.dart';
import 'package:flutter/material.dart';

import '../../../constants/locale_keys.g.dart';
import '../../../widgets/locale_text.dart';

class AddBabyView extends StatefulWidget {
  const AddBabyView({super.key});

  @override
  State<AddBabyView> createState() => _AddBabyViewState();
}

class _AddBabyViewState extends State<AddBabyView> with InputValidationMixin {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  Gender _gender = Gender.female;
  String? _pickedImageBase64;
  final key = GlobalKey();

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
            image: _pickedImageBase64 == null 
              ? AssetImage("assets/images/img_default_baby.jpg")
              : MemoryImage(base64Decode(_pickedImageBase64!)) as ImageProvider
          )
        ),
      ),
    ).wrapPadding(AppPaddings.padding12);
  }

  BorderedButton addPhotoButton() {
    return BorderedButton(
      padding: EdgeInsets.zero,
      child: LocaleText(
        text: LocaleKeys.addPhoto, 
        style: AppTextStyles.h6Regular.copyWith(color: context.colorScheme.primary)
      ),
      onPressed: () async {
        final picker = ImagePickService.instance;
        final pickSource = await picker.showImageSource(context);
        if (pickSource != null) {
          _pickedImageBase64 = await picker.pick(pickSource);
          setState(() { });
        }
      },
    );
  }

  Widget addBabyForm() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AppTextFormField(
              labelText: "Name",
              controller: _nameController,
              textInputAction: TextInputAction.next,
              validator: isValid
            ),
            SpaceBox.h16(),
            AppTextFormField(
              labelText: "Age",
              controller: _ageController,
              onlyDigits: true,
              validator: isValid
            ),
            SpaceBox.h16(),
            GenderSelect(onChanged: (Gender gender) => print(gender),),
            SpaceBox.h16(),
            saveButton(),
          ],
        ).wrapPadding(AppPaddings.padding8),
      ),
    ).wrapPadding(AppPaddings.padding8);
  }

  BorderedButton saveButton() {
    return BorderedButton(
      btnWidth: context.dynamicWidth(0.56),
      backgroundColor: context.colorScheme.primary,
      borderColor: context.colorScheme.onPrimary,
      splashColor: context.colorScheme.onPrimary,
      padding: EdgeInsets.zero,
      borderWidth: 2,
      child: LocaleText(
        text: LocaleKeys.add, 
        style: AppTextStyles.h4Regular.copyWith(color: context.colorScheme.onSecondary)
      ), 
      onPressed: () {
        final isValid = _formKey.currentState?.validate();
        if (isValid == null || !isValid) return;
        UserRecords.instance.babyList.add(
          Baby(
            id: 5, 
            name: _nameController.text.trim(), 
            age: int.tryParse(_ageController.text) ?? 0, 
            gender: _gender.name,
            profileImage: _pickedImageBase64,
          ),
        );
      },
    );
  }

}