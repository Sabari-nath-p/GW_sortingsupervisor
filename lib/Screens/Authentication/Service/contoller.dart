import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gw_sorting/Screens/Dashboard/DashboardScreen.dart';
import 'package:gw_sorting/Utils/headers.dart';
import 'package:gw_sorting/main.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  bool loading = false;
  sendLogin() async {
    loading = true;
    update();

    final Response = await post(Uri.parse(baseUrl + "auth/login"),
        //headers: authHeader,
        body: {"PhoneOrEmail": phone.text, "password": password.text});
    loading = false;
    update();
    print(Response.body);
    print(Response.statusCode);
    var data = json.decode(Response.body);
    log(baseUrl + "auth/login" + "--->" + Response.statusCode.toString());
    if (Response.statusCode == 201) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (data["user"]["user_type"] == "sorting_supervisor") {
        pref.setString("TOKEN", data["tokens"]["accessToken"]);
        pref.setString("LOGIN", "IN");
        pref.setString("USERID", data["user"]["id"].toString());
        token = data["tokens"]["accessToken"];
        userID = data["user"]["id"].toString();

        authHeader = {"Authorization": "Bearer $token"};
        Get.to(() => DashboardScreenView(), transition: Transition.rightToLeft);
      } else {
        Fluttertoast.showToast(msg: "Please login as a sorting supervisor");
      }
    } else {
      Fluttertoast.showToast(msg: data["message"].toString());
    }
  }
}
