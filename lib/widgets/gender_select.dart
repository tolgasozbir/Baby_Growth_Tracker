import 'package:baby_growth_tracker/constants/app_styles.dart';
import 'package:flutter/material.dart';

enum Gender { female, male }

extension GenderExtension on Gender{
  String get getName {
    return this.name;
  } 
}

class GenderSelect extends StatefulWidget {
  const GenderSelect({super.key, required this.onChanged});

  final ValueChanged<Gender> onChanged;

  @override
  State<GenderSelect> createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  Gender _genderValue = Gender.female;
  double _iconSize = 80;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: Gender.values.map((gender) => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          setState(() {
            _genderValue = gender;
            widget.onChanged.call(_genderValue);
          });
        },
        child: Column(
          children: [
            gender == Gender.female 
              ? Icon(
                  Icons.female, 
                  size: _iconSize, 
                  color: _genderValue == Gender.female 
                    ? Colors.pinkAccent
                    : Colors.black45
                  ) 
              : Icon(
                  Icons.male, 
                  size: _iconSize, 
                  color: _genderValue == Gender.male 
                    ? Colors.blueAccent
                    : Colors.black45
                ),
            Text(gender.getName, style: AppTextStyle.h5Bold.copyWith(color: Colors.black54),)
          ],
        ),
      )).toList(),
    );
  }

}