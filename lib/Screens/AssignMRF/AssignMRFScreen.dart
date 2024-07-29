import 'package:flutter/material.dart';
import 'package:gw_sorting/Screens/AssignMRF/Views/AssignMRFView.dart';
import 'package:gw_sorting/Screens/Dashboard/Models/MrfJobAssignModel.dart';

class AssignMRFScreen extends StatelessWidget {
  AssignJobModel model;
  AssignMRFScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: AssignMRFView(model: model,)),
    );
  }
}
