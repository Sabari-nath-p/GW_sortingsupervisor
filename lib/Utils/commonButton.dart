import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gw_sorting/Utils/textLabel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget commonButton(
    {String buttonName = "Submit",
    Function? onTap,
    bool loading = false,
    double buttonTextSize = 20,
    double width = 390,
    double height = 50}) {
  return GestureDetector(
    onTap: () {
      if (onTap != null) onTap();
    },
    child: Container(
      width: width.w,
      height: height.h,
      // margin: EdgeInsets.only(left: 6.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xff036163), borderRadius: BorderRadius.circular(10)),
      child: (loading)
          ? LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.white, size: 24)
          : appText(buttonName,
              size: buttonTextSize.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
    ),
  );
}
