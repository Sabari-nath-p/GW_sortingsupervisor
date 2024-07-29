import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gw_sorting/Utils/textLabel.dart';

Widget InputTextField(
    {required String title,
    TextEditingController? controller,
    String hint = "",
    TextInputType? keyType,
    isEnable = true,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool isHide = false}) {
  return Container(
    height: 85.h,
    margin: EdgeInsets.symmetric(vertical: 2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText(title,
            size: 13.sp, fontWeight: FontWeight.w500, color: Colors.black),
        Container(
          margin: EdgeInsets.only(top: 7.h),
          decoration: BoxDecoration(
              // color: Colors.grey.shade200,
              border: Border.all(
                color: Colors.grey.shade400,
              ),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.only(left: 8),
          //     width: 320.w,

          height: 50.h,
          child: TextFormField(
            maxLines: 1,
            controller: controller,
            obscureText: isHide,
            enabled: isEnable,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: keyType,
            decoration: InputDecoration(
                hintText: hint,
                // isDense: true,
                // isCollapsed: true,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                hintStyle: TextStyle(
                  fontFamily: "lexend",
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
                border: InputBorder.none),
          ),
        ),
      ],
    ),
  );
}
