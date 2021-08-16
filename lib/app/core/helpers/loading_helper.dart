import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoading() {
  Get.defaultDialog(
      title: "Пожалуйста, подождите...",
      titleStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
      radius: 15.0,
      content: Container(
          padding: EdgeInsets.all(24.0),
          child: CircularProgressIndicator(
            color: Theme.of(Get.context!).accentColor,
          )
      ),
      barrierDismissible: false
  );
}

void dismissLoadingWidget() {
  Get.back();
}