import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';
import 'capsule_widget.dart';

class PhotoCard3 extends StatelessWidget {
  const PhotoCard3({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
          width: 340.w,
          height: 600.h,
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [
                const Color(0xFF000000).withOpacity(0.0),
                const Color(0xFF000000).withOpacity(0.5),
                const Color(0xFF000000).withOpacity(1.0),
              ],
            ),
            borderRadius: BorderRadius.circular(20.r),
            image: const DecorationImage(
              image: AssetImage(image3),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          child: Container(
            height: 700.h,
            width: 340.w,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black,
                ])),
          ),
        ),
        Positioned(
            left: 24.w,
            bottom: 220.h,
            child: const CapsuleWidget(icon: icStarBlack, text: strLikeCount)),
        Positioned(
          child: Container(
            height: 700.h,
            width: 340.w,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black,
                ])),
          ),
        ),
        Positioned(
            left: 24.w,
            right: 75.w,
            bottom: 60.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          strName,
                          style: TextStyle(
                              color: colorWhiteText,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          strAge,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: colorWhiteText,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const CapsuleWidget(text: "💖 진지한 연애를 찾는 중"),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        const CapsuleWidget(text: "🍸 전혀 안 함"),
                        SizedBox(width: 2.w),
                        const CapsuleWidget(text: "🚬 비흡연"),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    const CapsuleWidget(text: "💪🏻 매일 1시간 이상"),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        const CapsuleWidget(text: "🤝 만나는 걸 좋아함"),
                        SizedBox(width: 2.w),
                        const CapsuleWidget(text: "INFP"),
                      ],
                    ),
                  ],
                ),
              ],
            )),
        Positioned(
          right: 20,
          bottom: 65,
          child: SvgPicture.asset(
            icHeart,
            width: 48.w,
            height: 48.w,
          ),
        ),
        Positioned(
            bottom: 0,
            left: 155.w,
            child: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 35.h,
              ),
              onPressed: () {},
            ))
      ],
    );
  }
}
