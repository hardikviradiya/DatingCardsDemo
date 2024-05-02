import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      elevation: 10,
      backgroundColor: Colors.black,
      activeColor: colorPink,
      color: colorGray,
      cornerRadius: 14,
      style: TabStyle.fixed,
      items: [
        TabItem(
            icon: SvgPicture.asset(icHomeDisabled),
            title: strHome,
            activeIcon: SvgPicture.asset(icHome)),
        TabItem(
            icon: SvgPicture.asset(icSpot), title: strSpot, isIconBlend: true),
        TabItem(
          icon: SvgPicture.asset(
            icMainMenu,
            width: 250.w,
            height: 250.h,
          ),
        ),
        TabItem(
            icon: SvgPicture.asset(icChat), title: strChat, isIconBlend: true),
        TabItem(
            icon: SvgPicture.asset(icProfile),
            title: strProfile,
            isIconBlend: true),
      ],
    );
  }
}
