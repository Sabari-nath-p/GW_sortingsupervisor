import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gw_sorting/Screens/CreateSorting/Model/PlantModel.dart';
import 'package:gw_sorting/Screens/Dashboard/Models/MrfJobAssignModel.dart';
import 'package:gw_sorting/Screens/Dashboard/Models/SortingModel.dart';
import 'package:gw_sorting/Screens/Dashboard/Models/UserModel.dart';
import 'package:gw_sorting/Utils/headers.dart';
import 'package:gw_sorting/main.dart';
import 'package:http/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DashboardController extends GetxController {
  RefreshController dashrefreshController = RefreshController();

  List<AssignJobModel> assignJobList = [];
  UserModel? userModel;
  fetchMrfRequest() async {
    final Response = await get(Uri.parse(baseUrl + "mrf-jobs?status=assigned"),
        headers: authHeader);

    assignJobList.clear();
    if (Response.statusCode == 200) {
      var jdata = json.decode(Response.body);

      for (var data in jdata["data"]) {
        assignJobList.add(AssignJobModel.fromJson(data));
      }

      update();
    }

    dashrefreshController.refreshCompleted();
    update();
  }

  fetchUserDetailes() async {
    final Response =
        await get(Uri.parse(baseUrl + "users/$userID"), headers: authHeader);

    print(Response.body);
    print(userID);
    print(Response.statusCode);

    if (Response.statusCode == 200) {
      userModel = UserModel.fromJson(json.decode(Response.body)["data"]);
      update();
      listMRFPlants();
    }
  }

  List<SortingDataModel> sortingList = [];
  RefreshController rfCtrl = RefreshController();
  fetchSorting({bool stage = false}) async {
    if (selectedPlant != null) {
      final response = await get(
        Uri.parse(
            baseUrl + "conveyor-belt-storage?plant_id=${selectedPlant!.id!}"),
        headers: authHeader,
      );

      if (response.statusCode == 200) {
        var sdata = json.decode(response.body);

        for (var data in sdata["data"]) {
          sortingList.add(SortingDataModel.fromJson(data));
        }
        update();
      }
    } else {
      rfCtrl.refreshCompleted();
      if (stage) Fluttertoast.showToast(msg: "Please select a plants");
      update();
    }
  }

  List PlantList = [];
  PlantModel? selectedPlant;

  listMRFPlants() async {
    final Response = await get(
        Uri.parse(
            baseUrl + "mrf-facility/${userModel!.mrf!.mrfInner!.id}/plants"),
        headers: authHeader);

    if (Response.statusCode == 200) {
      var jData = json.decode(Response.body);
      PlantList.clear();
      ;
      for (var data in jData["data"]) {
        PlantList.add(PlantModel.fromJson(data));
      }
    }

    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUserDetailes();

    fetchMrfRequest();
    fetchSorting();
  }
}
