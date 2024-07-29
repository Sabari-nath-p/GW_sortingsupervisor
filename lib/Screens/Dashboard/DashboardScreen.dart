import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gw_sorting/Screens/CreateSorting/CreateSortingScreeen.dart';
import 'package:gw_sorting/Screens/Dashboard/Views/DashbaordView.dart';
import 'package:gw_sorting/Screens/Dashboard/Views/ProfileView.dart';
import 'package:gw_sorting/Screens/Dashboard/Views/sortingView.dart';
import 'package:gw_sorting/Screens/Dashboard/service/controller.dart';
import 'package:gw_sorting/Utils/appColor.dart';

class DashboardScreenView extends StatefulWidget {
  DashboardScreenView({super.key});

  @override
  State<DashboardScreenView> createState() => _DashboardScreenViewState();
}

class _DashboardScreenViewState extends State<DashboardScreenView> {
  int selectedIndex = 0;
  DashboardController dctrl = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DashboardController>(builder: (_) {
        return Container(
          child: (selectedIndex == 0)
              ? DashBoardView()
              : (selectedIndex == 1)
                  ? SortingView()
                  : ProfileView(),
        );
      }),
      floatingActionButton: (selectedIndex != 1)
          ? null
          : GestureDetector(
              onTap: () {
                Get.to(
                    () => CreateSortingScreen(
                          mrfId: dctrl.userModel!.mrf!.mrfInner!.id!,
                        ),
                    transition: Transition.rightToLeft);
              },
              child: CircleAvatar(
                backgroundColor: AppColor.primaryColor,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 14,
          selectedFontSize: 16,
          currentIndex: selectedIndex,
          selectedItemColor: AppColor.primaryColor,
          selectedLabelStyle: TextStyle(fontFamily: "lexend"),
          unselectedLabelStyle: TextStyle(fontFamily: "lexend"),
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "lib/Assets/icons/Home.png",
                  width: 24,
                  color: selectedIndex == 0 ? AppColor.primaryColor : null,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "lib/Assets/icons/Add.png",
                  width: 24,
                  color: selectedIndex == 1 ? AppColor.primaryColor : null,
                ),
                label: "Sort"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "lib/Assets/icons/profile.png",
                  color: selectedIndex == 2 ? AppColor.primaryColor : null,
                  width: 24,
                ),
                label: "Profile")
          ]),
    );
  }
}
