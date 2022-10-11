import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget verticalSpace(double space) {
  return SizedBox(
    height: getHeight(space),
  );
}

Widget horizontalSpace(double space) {
  return SizedBox(
    width: getWidth(space),
  );
}

double getDisplayHeight({bool? appBar}) => appBar == null
    ? Get.height - Get.mediaQuery.padding.top
    : Get.height - Get.mediaQuery.padding.top - AppBar().preferredSize.height;

double getDisplayWidth() => Get.width;

double getWidth(double value) => getDisplayWidth() * value;

double getHeight(double value) => getDisplayHeight() * value;
