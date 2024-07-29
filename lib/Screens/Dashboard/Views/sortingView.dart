import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:gw_sorting/Screens/Dashboard/Views/sortingCardView.dart';
import 'package:gw_sorting/Screens/Dashboard/service/controller.dart';
import 'package:gw_sorting/Utils/InputDropDown.dart';
import 'package:gw_sorting/Utils/headers.dart';
import 'package:gw_sorting/Utils/textLabel.dart';
import 'package:gw_sorting/main.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SortingView extends StatelessWidget {
  SortingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<DashboardController>(builder: (_) {
        return Column(
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
                appText("WASTE TAKEN FOR SORTING",
                    size: 16, fontWeight: FontWeight.w500)
              ],
            ),
            Expanded(
                child: SmartRefresher(
              controller: _.rfCtrl,
              onRefresh: () {
                _.fetchSorting(stage: true);
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: InputDropDown(
                        title: "PLANT",
                        items: _.PlantList,
                        selectedValue: _.selectedPlant,
                        child: (value) => appText(value.name,
                            size: 14, fontWeight: FontWeight.w500),
                        change: (value) {
                          _.selectedPlant = value;
                          print(authHeader);
                          print(_.selectedPlant!.id);
                          print(baseUrl);
                          _.update();
                          _.fetchSorting(stage: true);
                        },
                      ),
                    ),
                    for (var data in _.sortingList)
                      SortingCardView(
                        Model: data,
                      ),
                  ],
                ),
              ),
            ))
          ],
        );
      }),
    );
  }
}
