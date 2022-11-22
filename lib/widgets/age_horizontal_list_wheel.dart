import 'package:baby_growth_tracker/constants/app_styles.dart';
import 'package:baby_growth_tracker/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AgeHorizontalListWheel extends StatefulWidget {
  const AgeHorizontalListWheel({super.key, this.selectedItem});

  final ValueChanged<int>? selectedItem;

  @override
  State<AgeHorizontalListWheel> createState() => _HorizontalListWheelState();
}

class _HorizontalListWheelState extends State<AgeHorizontalListWheel> {
  final Duration _animationDuration = Duration(milliseconds: 400);
  final double _unSelectedItemWidth = 50.0;
  final double _selectedItemWidth = 60.0;
  final double _perspective = 0.005;
  final int _itemCount = 10;
  final double _height = 80;
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("Select Age", style: AppStyles.h4Regular,),
        SizedBox(
          height: _height,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListWheelScrollView.useDelegate(
              itemExtent: _selectedItemWidth,
              perspective: _perspective,
              clipBehavior: Clip.none,
              renderChildrenOutsideViewport: true,
              onSelectedItemChanged: (selectedItem) {
                setState(()=> _selectedItem = selectedItem);
                widget.selectedItem?.call(_selectedItem);
              },
              childDelegate: ListWheelChildLoopingListDelegate(
                children: List.generate(_itemCount, (index) => RotatedBox(
                  quarterTurns: 1,
                  child: AnimatedContainer(
                    duration: _animationDuration,
                    width: index == _selectedItem ? _selectedItemWidth : _unSelectedItemWidth,
                    height: index == _selectedItem ? _selectedItemWidth : _unSelectedItemWidth,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: index == _selectedItem ? context.colorScheme.onPrimary : context.colorScheme.primary,
                      shape: BoxShape.circle
                    ),
                    child: Text(
                      '$index', 
                      style: AppStyles.h4Bold.copyWith(
                        color: index == _selectedItem 
                          ? context.colorScheme.primary 
                          : context.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                )),        
              ),
            )
          ),
        ),
        Divider(thickness: 1, height: 0,),
      ],
    );
  }
}