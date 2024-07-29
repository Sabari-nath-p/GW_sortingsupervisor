import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:gw_sorting/Screens/AssignMRF/AssignMRFScreen.dart';
import 'package:gw_sorting/Screens/Dashboard/Models/MrfJobAssignModel.dart';
import 'package:gw_sorting/Utils/appColor.dart';
import 'package:gw_sorting/Utils/commonButton.dart';
import 'package:gw_sorting/Utils/textLabel.dart';

class JobCardView extends StatelessWidget {
  AssignJobModel model;
  JobCardView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.w),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.primaryColor.withOpacity(.3))),
      child: Column(
        children: [
          _jobCardItem(
              "Id", "${model.jobId}", "lib/Assets/icons/calenderIcon.png"),
          _jobCardItem("Vehicle no", "${model.vehicleNo}",
              "lib/Assets/icons/calenderIcon.png"),
          _jobCardItem("Date", "${model.date}", "lib/Assets/icons/date.png"),
          _jobCardItem("Type", "${model.type}", "lib/Assets/icons/items.png"),
          SizedBox(
            height: 20,
          ),
          commonButton(
              buttonName: "Accept",
              onTap: () {
                Get.to(
                    () => AssignMRFScreen(
                          model: model,
                        ),
                    transition: Transition.rightToLeft);
              },
              width: 150.w,
              buttonTextSize: 14,
              height: 40)
        ],
      ),
    );
  }
}

Widget _jobCardItem(String title, String content, String asset) {
  return Container(
    padding: EdgeInsets.only(bottom: 10.h),
    margin: EdgeInsets.only(bottom: 7.h),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12))),
    child: Row(
      children: [
        Image.asset(
          asset,
          width: 15.w,
        ),
        SizedBox(
          width: 20.w,
        ),
        SizedBox(
            width: 130.w,
            child: appText(title,
                size: 13.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff6A6A6A))),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
            //  width: 130.w,
            child: appText(
          content,
          size: 13.sp,
          fontWeight: FontWeight.w600,
        )),
      ],
    ),
  );
}
