import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:gw_sorting/Screens/Authentication/AuthenticationScreen.dart';
import 'package:gw_sorting/Screens/Dashboard/DashboardScreen.dart';
import 'package:gw_sorting/Screens/Dashboard/service/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = (false)
    ? "https://api.greenworms.app/api/"
    : "https://api.greenworms.alpha.logidots.com/api/";
String token = "";
String userID = "";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  token = preferences.getString("TOKEN") ?? "";
  userID = preferences.getString("USERID") ?? "";
  runApp(gw_sorting());
}

class gw_sorting extends StatelessWidget {
  gw_sorting({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 850),
      builder: (context, child) => GetMaterialApp(
        home: (token == "") ? AuthenticationScreen() : DashboardScreenView(),
      ),
    );
  }
}
