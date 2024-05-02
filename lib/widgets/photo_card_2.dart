import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';
import 'capsule_widget.dart';

class PhotoCard2 extends StatelessWidget {
  const PhotoCard2({super.key});

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
              image: AssetImage(image2),
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
            bottom: 185.h,
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
                    SizedBox(
                        width: 230.w,
                        child: Text(
                          "서로 아껴주고 힘이 되어줄 사람 찾아요 선릉으로 직장 다니고 있고 여행 좋아해요 이상한 이야기하시는 분 바로 차단입니다",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: colorWhiteText2,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w300),
                        ))
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
