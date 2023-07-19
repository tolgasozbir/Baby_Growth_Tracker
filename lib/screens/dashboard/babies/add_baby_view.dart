
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:baby_growth_tracker/constants/app_styles.dart';
import 'package:baby_growth_tracker/extensions/context_extension.dart';
import 'package:baby_growth_tracker/extensions/string_extension.dart';
import 'package:baby_growth_tracker/models/baby.dart';
import 'package:baby_growth_tracker/providers/babies_provider.dart';
import 'package:baby_growth_tracker/services/image_pick_service.dart';
import 'package:baby_growth_tracker/mixins/input_validation_mixin.dart';
import 'package:baby_growth_tracker/widgets/app_text_form_field.dart';
import 'package:baby_growth_tracker/widgets/bordered_button.dart';
import 'package:baby_growth_tracker/widgets/gender_select.dart';
import 'package:baby_growth_tracker/widgets/space_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_strings.dart';
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
  String? _pickedImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: _bodyView()
    );
  }

  SingleChildScrollView _bodyView() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
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
          elevation: 4,
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
    return Padding(
      padding: AppPaddings.all12,
      child: SizedBox.square(
        dimension: context.dynamicHeight(0.14),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: context.colorScheme.primary, width: 3.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: _pickedImagePath == null 
                ? AssetImage(AppAssets.defaultBabyImage.path)
                : FileImage(File(_pickedImagePath!)) as ImageProvider
            )
          ),
        ),
      ),
    );
  }

  BorderedButton addPhotoButton() {
    return BorderedButton(
      padding: AppPaddings.none,
      child: LocaleText(
        text: LocaleKeys.common_addPhoto, 
        style: AppTextStyles.h6.copyWith(color: context.colorScheme.primary)
      ),
      onPressed: () async {
        final picker = ImagePickService.instance;
        final pickSource = await picker.showImageSource(context);
        if (pickSource != null) {
          _pickedImagePath = await picker.pick(pickSource);
          setState(() { });
        }
      },
    );
  }

  Widget addBabyForm() {
    return Padding(
      padding: AppPaddings.all8,
      child: Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: AppPaddings.all8,
            child: Column(
              children: [
                AppTextFormField(
                  labelText: LocaleKeys.child_name.locale,
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  validator: isValid
                ),
                const SpaceBox.h16(),
                AppTextFormField(
                  labelText: LocaleKeys.child_age.locale,
                  controller: _ageController,
                  onlyDigits: true,
                  maxLength: 1,
                  validator: isValid
                ),
                const SpaceBox.h16(),
                GenderSelect(onChanged: (Gender gender) => _gender = gender),
                const SpaceBox.h16(),
                saveButton(),
              ],
            ),
          )
        ),
      ),
    );
  }

  BorderedButton saveButton() {
    return BorderedButton(
      btnWidth: context.dynamicWidth(0.56),
      backgroundColor: context.colorScheme.primary,
      borderColor: context.colorScheme.onPrimary,
      foregroundColor: context.colorScheme.onPrimary,
      padding: EdgeInsets.zero,
      borderWidth: 2,
      child: LocaleText(
        text: LocaleKeys.common_add, 
        style: AppTextStyles.h4.copyWith(color: context.colorScheme.onSecondary)
      ), 
      onPressed: () async {
        final isValid = _formKey.currentState?.validate();
        if (isValid == null || !isValid) return;
        var baby = Baby(
          id: 5, 
          name: _nameController.text.trim(), 
          age: int.tryParse(_ageController.text) ?? 0, 
          gender: _gender.name,
          profileImage: _pickedImagePath,
          photoAlbum: [],
        );
        await context.read<BabiesProvider>().addBaby(baby);
        context.router.pop();
      },
    );
  }

}