import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gw_sorting/Screens/Dashboard/Models/SortingModel.dart';
import 'package:gw_sorting/Utils/appColor.dart';
import 'package:gw_sorting/Utils/textLabel.dart';

class SortingCardView extends StatelessWidget {
  SortingDataModel Model;
  SortingCardView({super.key, required this.Model});

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5),
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.primaryColor.withOpacity(.4))),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    width: 170.w,
                    child: appText("${Model.mrfPlantStorage!.plant!.name}",
                        size: 15)),
                Expanded(
                    child: appText("|  ${Model.storageSubCategory!.name!}",
                        size: 12, color: Colors.black45))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                    width: 165.w,
                    child: appText("${Model.shift ?? "--:--"}", size: 15)),
                Image.asset(
                  "lib/Assets/icons/sortingIcon.png",
                  width: 20.w,
                ),
                Expanded(
                    child: appText("  ${Model.quantity}",
                        size: 12, color: Colors.black))
              ],
            )
          ],
        ),
      ),
    );
  }
}
