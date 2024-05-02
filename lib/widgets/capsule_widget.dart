import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';

class CapsuleWidget extends StatelessWidget {
  final String? icon;
  final String text;

  const CapsuleWidget({super.key, this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      padding: EdgeInsets.only(left: 5.w, right: 6.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: Colors.black,
        border: Border.all(
          color: const Color(0xFF212121),
          width: 1.w,
        ),
      ),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            icon != null
                ? SvgPicture.asset(
                    icon!,
                    height: 15.h,
                    width: 15.w,
                    fit: BoxFit.fitHeight,
                  )
                : const SizedBox.shrink(),
            SizedBox(width: 5.w),
            Text(
              text,
              style: TextStyle(
                  color: colorWhiteText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            )
          ]),
    );
  }
}
