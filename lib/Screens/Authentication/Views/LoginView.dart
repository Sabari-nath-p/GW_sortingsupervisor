import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:gw_sorting/Screens/Authentication/Service/contoller.dart';
import 'package:gw_sorting/Screens/Dashboard/DashboardScreen.dart';
import 'package:gw_sorting/Screens/Dashboard/Views/DashbaordView.dart';
import 'package:gw_sorting/Utils/InputText.dart';
import 'package:gw_sorting/Utils/commonButton.dart';
import 'package:gw_sorting/Utils/textLabel.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  AuthenticationController ctrl = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(builder: (_) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 390.w,
            ),
            SizedBox(
                width: 118.w,
                child: Image.asset("lib/Assets/icons/gwicon.png")),
            InputTextField(
              title: "Email Id",
              controller: _.phone,
              keyType: TextInputType.emailAddress,
            ),
            InputTextField(
                title: "Password", controller: _.password, isHide: true),
            SizedBox(
              height: 20.h,
            ),
            commonButton(
                buttonName: "Login",
                loading: _.loading,
                onTap: () {
                  _.sendLogin();
                  // Get.to(() => DashboardScreenView(),
                  //     transition: Transition.rightToLeft);
                })
          ],
        ),
      );
    });
  }
}
