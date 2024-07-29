import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gw_sorting/Screens/Authentication/AuthenticationScreen.dart';
import 'package:gw_sorting/Screens/Dashboard/service/controller.dart';
import 'package:gw_sorting/Utils/InputText.dart';
import 'package:gw_sorting/Utils/appColor.dart';
import 'package:gw_sorting/Utils/commonButton.dart';
import 'package:gw_sorting/Utils/textLabel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  DashboardController dctrl = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            if (false)
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  //color: Colors.black45,
                  size: 18,
                ),
              ),
            SizedBox(
              width: 10,
            ),
            appText("PROFILE", size: 16, fontWeight: FontWeight.w500)
          ],
        ),
        SizedBox(
          height: 80.h,
        ),
        Container(
          width: 100.w,
          height: 100.w,
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
                  : appText(dctrl.userModel!.name!.substring(0, 2), size: 20)
              : LoadingAnimationWidget.discreteCircle(
                  color: AppColor.primaryColor, size: 20),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                if (dctrl.userModel != null)
                  InputTextField(
                      title: "Name",
                      controller:
                          TextEditingController(text: dctrl.userModel!.name!),
                      isEnable: false),
                if (dctrl.userModel != null)
                  InputTextField(
                      title: "Email",
                      controller:
                          TextEditingController(text: dctrl.userModel!.email!),
                      isEnable: false),
                if (dctrl.userModel != null)
                  InputTextField(
                      title: "Phone",
                      controller:
                          TextEditingController(text: dctrl.userModel!.phone!),
                      isEnable: false)
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: commonButton(
                buttonName: "Logout",
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();

                  pref.remove("TOKEN");
                  pref.remove("USERID");
                  pref.remove("LOGIN");
                  Get.offAll(() => AuthenticationScreen(),
                      transition: Transition.upToDown);
                },
                width: 100.w,
                height: 40,
                buttonTextSize: 14)),
        SizedBox(
          height: 30,
        )
      ],
    ));
  }
}
