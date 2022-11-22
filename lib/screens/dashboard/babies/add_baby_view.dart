import 'package:baby_growth_tracker/constants/app_styles.dart';
import 'package:baby_growth_tracker/extensions/context_extension.dart';
import 'package:baby_growth_tracker/extensions/widget_extension.dart';
import 'package:baby_growth_tracker/widgets/app_text_form_field.dart';
import 'package:baby_growth_tracker/widgets/bordered_button.dart';
import 'package:baby_growth_tracker/widgets/gender_radio_icon.dart';
import 'package:flutter/material.dart';
import '../../../widgets/age_horizontal_list_wheel.dart';

class AddBabyView extends StatefulWidget {
  const AddBabyView({super.key});

  @override
  State<AddBabyView> createState() => _AddBabyViewState();
}

class _AddBabyViewState extends State<AddBabyView> {
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

  SizedBox babyImageCard() {
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

  Padding circleImage() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox.square(
        dimension: context.dynamicHeight(0.14),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: context.colorScheme.primary, width: 3.0, style: BorderStyle.solid),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/img_default_baby.jpg"),
            )
          ),
        ),
      )
    );
  }

  BorderedButton addPhotoButton() {
    return BorderedButton(
      padding: EdgeInsets.zero,
      child: Text("Fotoğraf Ekle", style: AppStyles.h6Regular.copyWith(color: context.colorScheme.primary)), 
      onPressed: () {
      },
    );
  }

  Padding addBabyForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          children: [
            Column(
              children: [
                AppTextFormField(labelText: "Name",).wrapPadding(AppPaddings.padding8),
                AgeHorizontalListWheel(selectedItem: (value) => print(value)),
                GenderRadioIcons(onChanged: (Gender gender) => print(gender),),
                saveButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BorderedButton saveButton() {
    return BorderedButton(
      btnWidth: context.dynamicWidth(0.56),
      backgroundColor: context.colorScheme.primary,
      borderColor: context.colorScheme.onPrimary,
      splashColor: context.colorScheme.onPrimary,
      borderWidth: 2,
      child: Text("Ekle", style: AppStyles.h4Regular.copyWith(color: context.colorScheme.onSecondary)), 
      onPressed: () => null,
    );
  }



}