import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gw_sorting/Utils/textLabel.dart';

typedef _ChildItem = Widget Function(dynamic);
typedef onChange = Function(dynamic);

Widget InputDropDown(
    {required String title,
    required List items,
    required _ChildItem child,
    Function? change(dynamic value)?,
    dynamic selectedValue,
    String hint = "",
    TextInputType? keyType,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool isHide = false}) {
  return Container(
    height: 85.h,
    width: 390.w,
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
          padding: EdgeInsets.only(left: 8.w, right: 8.w),
          //     width: 320.w,

          height: 50.h,
          width: 390.w,
          child: DropdownButton(
            value: selectedValue,
            underline: Container(),
            isExpanded: true,
            // style: TextStyle(
            //   fontFamily: "lexend",
            //   fontWeight: FontWeight.w400,
            //   fontSize: 16.sp,
            // ),
            items: items
                .map((e) => DropdownMenuItem(value: e, child: child(e)))
                .toList(),
            onChanged: (value) {
              if (change != null) {
                change(value);
              }
            },
            // maxLines: 1,
            // controller: controller,
            // obscureText: isHide,
            // textAlign: TextAlign.start,
            // textAlignVertical: TextAlignVertical.center,
            // keyboardType: keyType,
            // d: InputDecoration(
            //     hintText: hint,
            //     // isDense: true,
            //     // isCollapsed: true,
            //     prefixIcon: prefixIcon,
            //     suffixIcon: suffixIcon,
            //     hintStyle: TextStyle(
            //       fontFamily: "lexend",
            //       fontWeight: FontWeight.w400,
            //       fontSize: 16.sp,
            //     ),
            //     border: InputBorder.none),
          ),
        ),
      ],
    ),
  );
}
