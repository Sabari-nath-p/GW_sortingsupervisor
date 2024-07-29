import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gw_sorting/Screens/Dashboard/Views/jobCardView.dart';
import 'package:gw_sorting/Screens/Dashboard/service/controller.dart';
import 'package:gw_sorting/Utils/appColor.dart';
import 'package:gw_sorting/Utils/textLabel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DashBoardView extends StatelessWidget {
  DashBoardView({super.key});
  DashboardController dctrl = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: 390.w,
            height: 150.h,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            color: AppColor.primaryColor,
            child: Row(
              children: [
                Container(
                  width: 60.w,
                  height: 60.w,
                  alignment: Alignment.center,
                  child: (dctrl.userModel != null)
                      ? (dctrl.userModel!.profileImage != null &&
                              dctrl.userModel!.profileImage != "")
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                dctrl.userModel!.profileImage!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : appText(dctrl.userModel!.name!.substring(0, 2),
                              size: 20)
                      : LoadingAnimationWidget.discreteCircle(
                          color: AppColor.primaryColor, size: 20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
                appText("   Hello",
                    color: Colors.white, size: 16, fontWeight: FontWeight.w300),
                appText(
                    (dctrl.userModel != null)
                        ? "  ${dctrl.userModel!.name}"
                        : "--:--",
                    size: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)
              ],
            ),
          ),
          Expanded(
              child: SmartRefresher(
            controller: dctrl.dashrefreshController,
            onRefresh: () {
              dctrl.fetchMrfRequest();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  for (var data in dctrl.assignJobList)
                    JobCardView(
                      model: data,
                    ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
