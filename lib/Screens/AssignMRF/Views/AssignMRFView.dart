import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:gw_sorting/Screens/AssignMRF/Models/conveyorBeltsModel.dart';
import 'package:gw_sorting/Screens/Dashboard/Models/MrfJobAssignModel.dart';
import 'package:gw_sorting/Screens/Dashboard/service/controller.dart';
import 'package:gw_sorting/Utils/InputDropDown.dart';
import 'package:gw_sorting/Utils/InputText.dart';
import 'package:gw_sorting/Utils/commonButton.dart';
import 'package:gw_sorting/Utils/headers.dart';
import 'package:gw_sorting/Utils/textLabel.dart';
import 'package:gw_sorting/main.dart';
import 'package:http/http.dart';

class AssignMRFView extends StatefulWidget {
  AssignJobModel model;
  AssignMRFView({super.key, required this.model});

  @override
  State<AssignMRFView> createState() => _AssignMRFViewState();
}

class _AssignMRFViewState extends State<AssignMRFView> {
  DashboardController dctrl = Get.put(DashboardController());

  String? selectedMethod;

  List<conveyorBeltModel> converbeltList = [];
  conveyorBeltModel? selectedConverBelt;
  bool loading = false;

  listMRFPlants() async {
    final Response = await get(
        Uri.parse(
            baseUrl + "mrf-facility/${widget.model.mrfFacilityId}/plants"),
        headers: authHeader);

    if (Response.statusCode == 200) {
      var jData = json.decode(Response.body);
      converbeltList.clear();
      ;
      for (var data in jData["data"]) {
        for (var belts in data["conveyorBelts"]) {
          converbeltList.add(conveyorBeltModel.fromJson(belts));
        }
      }
    }

    setState(() {});
  }

  AcceptMRF() async {
    loading = true;
    setState(() {});
    final Response = await post(
        Uri.parse(baseUrl + "mrf-jobs/${widget.model.id}/accept-job"),
        headers: authHeader,
        body: json.encode({
          "processing_type": "sorting",
          "status": (selectedMethod == "SORTING") ? "proceed" : "storage",
          if (selectedMethod == "SORTING")
            "conveyor_belt_id": selectedConverBelt!.id
        }));

    print(Response.body);
    print(Response.statusCode);

    if (Response.statusCode == 201) {
      Fluttertoast.showToast(msg: "Accepted Successfully");
      Get.back();
      dctrl.fetchMrfRequest();
    } else {
      var data = json.decode(Response.body);
      Fluttertoast.showToast(msg: data["message"].toString());
    }

    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listMRFPlants();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (_) {
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
              appText("Assign Job to MRF",
                  size: 16, fontWeight: FontWeight.w500)
            ],
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  InputDropDown(
                    title: "SORTING/ STORAGE",
                    items: [
                      "SORTING",
                      "STORAGE",
                    ],
                    selectedValue: selectedMethod,
                    child: (value) =>
                        appText(value, size: 14, fontWeight: FontWeight.w500),
                    change: (value) {
                      setState(() {
                        print(token);
                        selectedMethod = value;
                      });
                    },
                  ),
                  if (selectedMethod == "SORTING")
                    InputDropDown(
                      title: "SORTING MACHINE",
                      items: converbeltList,
                      selectedValue: selectedConverBelt,
                      child: (model) => appText(model.name,
                          size: 14, fontWeight: FontWeight.w500),
                      change: (value) {
                        selectedConverBelt = value;
                        setState(() {});
                      },
                    ),
                  InputTextField(
                      title: "Vehicle No".toUpperCase(),
                      controller:
                          TextEditingController(text: widget.model.vehicleNo),
                      isEnable: false)
                ],
              ),
            ),
          )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
              child: commonButton(
                  buttonName: "Continue",
                  loading: loading,
                  onTap: () {
                    setState(() {});

                    if (selectedConverBelt != null && selectedMethod != null) {
                      AcceptMRF();
                    } else {
                      Fluttertoast.showToast(msg: "Please fill to continue");
                    }
                  }))
        ],
      );
    });
  }
}
