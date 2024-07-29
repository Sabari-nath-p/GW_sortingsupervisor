import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gw_sorting/Screens/AssignMRF/Models/conveyorBeltsModel.dart';
import 'package:gw_sorting/Screens/CreateSorting/Model/PlantModel.dart';
import 'package:gw_sorting/Screens/CreateSorting/Model/StorageSubCategoryModel.dart';
import 'package:gw_sorting/Screens/Dashboard/Models/MrfJobAssignModel.dart';
import 'package:gw_sorting/Screens/Dashboard/service/controller.dart';
import 'package:gw_sorting/Utils/InputDropDown.dart';
import 'package:gw_sorting/Utils/InputText.dart';
import 'package:gw_sorting/Utils/commonButton.dart';
import 'package:gw_sorting/Utils/headers.dart';
import 'package:gw_sorting/Utils/textLabel.dart';
import 'package:gw_sorting/main.dart';
import 'package:http/http.dart';

class CreateSortingScreen extends StatefulWidget {
  int mrfId;
  CreateSortingScreen({super.key, required this.mrfId});

  @override
  State<CreateSortingScreen> createState() => _CreateSortingScreenState();
}

class _CreateSortingScreenState extends State<CreateSortingScreen> {
  List<PlantModel> plantList = [];
  List<storageSubcategoryModel> storageList = [];

  listMRFPlants() async {
    final Response = await get(
        Uri.parse(baseUrl + "mrf-facility/${widget.mrfId}/plants"),
        headers: authHeader);

    if (Response.statusCode == 200) {
      var jData = json.decode(Response.body);
      plantList.clear();
      ;
      for (var data in jData["data"]) {
        plantList.add(PlantModel.fromJson(data));
      }
    }

    setState(() {});
  }

  listsubCategory() async {
    final Response = await get(Uri.parse(baseUrl + "storage-sub-category"),
        headers: authHeader);
    if (Response.statusCode == 200) {
      var data = json.decode(Response.body);
      for (var dt in data["data"]) {
        storageList.add(storageSubcategoryModel.fromJson(dt));
      }
    }
    setState(() {});
  }

  assign() async {
    setState(() {
      loading = true;
    });
    final Response =
        await post(Uri.parse(baseUrl + "mrf-plant-storage/add-to-conveyor"),
            headers: authHeader,
            body: json.encode({
              "conveyor_belt_id": selectedConveryBelt!.id,
              "storage_sub_category_id":
                  selectedStorageCategory!.storageCategory!.id,
              "plant_id": selectedPlant!.id,
              "shift": selectedShift,
              "quantity": double.parse(weightController.text).toDouble()
            }));
    setState(() {
      loading = false;
    });
    print(Response.body);
    print(Response.statusCode);
    var jdata = json.decode(Response.body);
    if (Response.statusCode == 200 || Response.statusCode == 201) {
      DashboardController cltr = Get.put(DashboardController());
      Fluttertoast.showToast(msg: jdata["message"].toString());
      cltr.fetchSorting();
      Get.back();
    } else {
      Fluttertoast.showToast(msg: jdata["message"].toString());
    }
  }

  PlantModel? selectedPlant;
  ConveyorBelts? selectedConveryBelt;
  storageSubcategoryModel? selectedStorageCategory;
  String? selectedShift;
  TextEditingController weightController = TextEditingController();
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listMRFPlants();
    listsubCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  InputDropDown(
                    title: "PLANT",
                    items: plantList,
                    selectedValue: selectedPlant,
                    child: (value) => appText(value.name,
                        size: 14, fontWeight: FontWeight.w500),
                    change: (value) {
                      setState(() {
                        selectedPlant = value;
                        setState(() {});
                      });
                    },
                  ),
                  InputDropDown(
                    title: "MATERIAL TYPE",
                    items: storageList,
                    selectedValue: selectedStorageCategory,
                    child: (value) => appText(value!.name!,
                        size: 14, fontWeight: FontWeight.w500),
                    change: (value) {
                      setState(() {
                        selectedStorageCategory = value;
                        setState(() {});
                      });
                    },
                  ),
                  InputDropDown(
                    title: "SHIFT",
                    items: [
                      "SHIFT 1",
                      "SHIFT 2",
                      "SHIFT 3",
                    ],
                    selectedValue: selectedShift,
                    child: (value) =>
                        appText(value, size: 14, fontWeight: FontWeight.w500),
                    change: (value) {
                      setState(() {
                        selectedShift = value;
                      });
                    },
                  ),
                  if (selectedPlant != null)
                    FadeInRight(
                      child: InputDropDown(
                        title: "Conveyer Belt",
                        items: selectedPlant!.conveyorBelts ?? [],
                        selectedValue: selectedConveryBelt,
                        child: (value) => appText(value.name,
                            size: 14, fontWeight: FontWeight.w500),
                        change: (value) {
                          print(value);
                          setState(() {
                            selectedConveryBelt = value;
                          });
                        },
                      ),
                    ),
                  InputTextField(
                      title: "WEIGHT OF WASTE",
                      controller: weightController,
                      keyType: TextInputType.number)
                ],
              ),
            ),
          )),
          Container(
            padding: EdgeInsets.all(20.h),
            child: commonButton(
                buttonName: "Continue",
                loading: loading,
                onTap: () {
                  if (selectedPlant != null &&
                      selectedConveryBelt != null &&
                      selectedShift != null &&
                      selectedStorageCategory != null &&
                      weightController.text.isNotEmpty) {
                    assign();
                  } else {
                    Fluttertoast.showToast(msg: "Please fill to continue");
                  }
                }),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      )),
    );
  }
}
