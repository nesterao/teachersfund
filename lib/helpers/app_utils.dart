import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teachersfund/shared/constants.dart';

Map<String, String> getHeaders(String token) => <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };

void logInfo(dynamic info) {
  if (kDebugMode) {
    print(info);
  }
}

void closeKeyboard() {
  Get.focusScope!.unfocus();
  Get.focusScope!.requestFocus(FocusNode());

  FocusNode? currentFocus = Get.focusScope;

  if (!getBoolean(currentFocus?.hasPrimaryFocus)) {
    FocusManager.instance.primaryFocus?.unfocus();
    currentFocus?.unfocus();
  }
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}

bool getBoolean(bool? data) => data ?? false;

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

String limitedWord(String word, int limit) => word.trim().length <= limit
    ? word.trim()
    : word.trim().substring(0, limit + 1).replaceRange(limit - 2, null, '..');

void handleException(dynamic e,
    [Function(dynamic e)? onError, bool showDialog = false]) {
  if (onError != null) {
    onError(e);
  } else if (showDialog) {
    if (e is SocketException || e is HttpException || e is HandshakeException) {
      DialogUtil.showErrorSnackBar(e.message);
    } else {
      DialogUtil.showErrorSnackBar(e.toString());
    }
  }
}

class DialogUtil {
  static void showDialogBox({
    String? title,
    TextStyle? titleStyle,
    Widget? content,
    String? yesLabel,
    String? noLabel,
    VoidCallback? yesVoidCallBack,
    VoidCallback? noVoidCallBack,
    bool singleCallBack = false,
    bool barrierDismissible = false,
  }) {
    Get.defaultDialog(
      radius: 4,
      barrierDismissible: barrierDismissible,
      title: title!,
      titleStyle: titleStyle,
      titlePadding: const EdgeInsets.only(top: 16),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          content!,
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              if (!singleCallBack)
                Expanded(
                  child: TextButton(
                    onPressed: noVoidCallBack,
                    child: Text(noLabel?.toUpperCase() ?? 'NO'),
                  ),
                ),
              if (!singleCallBack) const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: yesVoidCallBack,
                  child: Text(yesLabel?.toUpperCase() ?? 'YES'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static void showErrorSnackBar(String e, {String? title}) {
    Get.rawSnackbar(
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: kErrorColor,
      borderRadius: 4,
      title: title,
      messageText: Text(
        e,
        maxLines: 30,
        textAlign: TextAlign.left,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeInOut,
      // barBlur: 36,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 4),
      onTap: (_) => Get.back(),
      // mainButton: GestureDetector(
      //   onTap: Get.back,
      //   child: Padding(
      //     padding: const EdgeInsets.only(right: 24.0),
      //     child: Text(
      //       'Dismiss'.toUpperCase(),
      //       // style: TextStyle(color: kLightTertiaryColor),
      //     ),
      //   ),
      // ),
    );
  }

  static void showSuccessSnackBar(String e, [String? title]) {
    Get.rawSnackbar(
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: kColorLightSecondary,
      borderRadius: 4,
      title: title,
      titleText: title == null
          ? null
          : Text(
              title,
              style: const TextStyle(color: Colors.black87),
            ),
      messageText: Text(
        e,
        maxLines: 30,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeInOut,
      barBlur: 16,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 4),
    );
  }
}
