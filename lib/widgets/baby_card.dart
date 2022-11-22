import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:baby_growth_tracker/models/baby.dart';

import '../constants/app_styles.dart';

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
          color: ui.Color(0xFFF4F4F7),
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
        backgroundColor: ui.Color(0xFF3D3082),
        child: CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage("assets/images/img_default_baby.jpg"),
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
          Text(
            baby.name, 
            style: AppTextStyle.h3Bold.copyWith(color: ui.Color(0xFF3D3082)),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "${baby.age} Yaşında", 
            style: AppTextStyle.h4Regular.copyWith(color: Colors.black45),
          ), 
        ],
      ),
    );
  }

  Column genderAndArrowIcon(String gender) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.male, color: Color(0xffAAAAAA), size: 56,),
        Icon(Icons.chevron_right, color: Color(0xFF3D3082), size: 56,),
      ],
    );
  }
  
}

class WavePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    Paint paint = Paint()
      ..color = ui.Color(0xFFE7E7E7)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(width, 0);
    path.lineTo(width, height * 0.5);
    path.quadraticBezierTo(width * 0.7, height * 0.28, width * 0.5, height * 0.67);
    path.quadraticBezierTo(width* 0.25, height * 1,0, height * 0.64);
    path.lineTo(0,0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

// import 'dart:convert';
// import 'package:baby_growth_tracker/constants/app_styles.dart';
// import 'package:baby_growth_tracker/models/baby.dart';
// import 'package:flutter/material.dart';

// class BabyCard extends StatelessWidget {
//   const BabyCard({super.key, required this.baby, this.height = 160, this.padding, this.margin, this.color, this.borderRadius, this.imageBorder})
//   : assert(height >= 160);

//   final Baby baby;
//   ///Must be at least 160 height. Default value : 160
//   final double height;
//   ///Default value : EdgeInsets.all(8.0)
//   final EdgeInsets? padding;
//   ///Default value : EdgeInsets.only(bottom: 8.0),
//   final EdgeInsetsGeometry? margin;
//   ///Card background color.
//   final Color? color;
//   ///Default value : BorderRadius.circular(12)
//   final BorderRadiusGeometry? borderRadius;
//   ///Default value : Border.all(color: Colors.yellow, width: 3.0, style: BorderStyle.solid),
//   final BoxBorder? imageBorder;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       padding: padding ?? const EdgeInsets.all(8.0),
//       margin: margin ?? const EdgeInsets.only(bottom: 8.0),
//       decoration: BoxDecoration(
//         color: color ?? Color(0xFF50008C),
//         borderRadius: borderRadius ?? BorderRadius.circular(12)
//       ),
//       child: Row(
//         children: [
//           circleImage(),
//           babyInfo(),
//           rightIcon(),
//         ],
//       ),
//     );
//   }

//   Expanded circleImage(){
//     return Expanded(
//       flex: 2,
//       child: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: imageBorder ?? Border.all(color: Colors.yellow, width: 3.0, style: BorderStyle.solid),
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: baby.image == null 
//               ? AssetImage("assets/images/img_default_baby.jpg")
//               : MemoryImage(base64Decode(baby.image!)) as ImageProvider,
//           ),
//         ),
//       ),
//     );
//   }

//     Expanded babyInfo() {
//     return Expanded(
//       flex: 3,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             baby.name, 
//             style: AppStyles.h3Bold.copyWith(color: Colors.white),
//             overflow: TextOverflow.ellipsis,
//           ),
//           Text(
//             "${baby.age} Yaşında", 
//             style: AppStyles.h4Regular.copyWith(color: Colors.white60),
//           ),
//           Icon(
//             baby.gender == "Erkek" 
//               ? Icons.male 
//               : Icons.female, 
//             color: Colors.white38,
//             size: 64,
//           ) 
//         ],
//       ),
//     );
//   }

//   Expanded rightIcon() {
//     return Expanded(
//       child: Icon(
//         Icons.chevron_right,
//         color: Colors.white70,
//         size: 72,
//       ),
//     );
//   }
// }