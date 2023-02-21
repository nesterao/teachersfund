import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teachersfund/helpers/app_utils.dart';
import 'package:teachersfund/pages/home_page.dart';
import 'package:teachersfund/shared/config.dart';

import '../helpers/request_manager.dart';
import '../models/core_models.dart';
import '../models/dto_models.dart';
import '../shared/constants.dart';

class AuthController extends GetxController {
  RxBool loading = false.obs;
  final RequestManager requestManager = RequestManager();
  RxString stuffId = ''.obs;
  RxList<String> districts = <String>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    //await getDistricts();
  }

  @override
  void onReady() {
    FlutterNativeSplash.remove();
  }

  Future<void> getDistricts() async {
    try {
      final calRes = await requestManager.sendGraphQLQuery(
        Constants.BASE_URL,
        '''
query districts {
  districts
}
        ''',
      );

      logInfo(calRes);

      if (calRes != null) {
        districts.value = (calRes as List).map((e) => e as String).toList();
      }
    } catch (e) {
      logInfo(e);
      handleException(e, null, true);
    } finally {
      // loading.value = false;
    }
  }

  Future<void> login(String pin) async {
    try {
      loading.value = true;

      final calRes = await requestManager.sendGraphQLMutation(
        Constants.BASE_URL,
        r'''
        mutation login {
    login (command: {staffNumber: "val1", pin: "val2"}) {
    success
    message
    data {
      token, firstName, lastName, staffId, memberStatus, memberType, phoneNumber
    }
  }
}
        '''
            .replaceFirst('val1', stuffId.value)
            .replaceFirst('val2', pin),
      );
      // logInfo(calRes);
      // return;
      final BaseResponse res =
          BaseResponse.fromMap(calRes as Map<String, dynamic>);

      if (res.success) {
        UserData user = UserData.fromMap(res.data);
        logInfo(user.toMap().toString());
        await GetStorage()
            .write(Constants.USER_DATA, res.data)
            .whenComplete(() {
          String m = getBoolean(res.message?.isNullOrBlank)
              ? 'Login successfully'
              : res.message ?? '';

          // DialogUtil.showSuccessSnackBar(m);

          // Get.offAllNamed(AppRoutes.MAIN);
          Get.to(() => const HomePage());
        });
      } else {
        DialogUtil.showErrorSnackBar('${res.message} Nester');
      }
    } catch (e) {
      handleException(e, null, true);
    } finally {
      loading.value = false;
    }
  }

  Future<void> validateSignUp(String staffID) async {
    if (Get.isSnackbarOpen) Get.back();
    closeKeyboard();
    try {
      loading.value = true;
      final calRes = await requestManager.sendGraphQLQuery(
        Constants.BASE_URL,
        r'''
       query enquiry {
  enquiry (staffNumber: "val1") {
    success
    data{
      isFound, isRegistered, firstName, 
      memberStatus, middleNames, staffNumber
      memberType
    }
  }
}
        '''
            .replaceFirst('val1', staffID),
      );

      logInfo(calRes);

      final BaseResponse res =
          BaseResponse.fromMap(calRes as Map<String, dynamic>);

      if (res.success) {
        stuffId.value = staffID;
        EnquireResultDto result = EnquireResultDto.fromMap(res.data);

        if (result.isFound && result.isRegistered) {
          /// USER FOUND AND REGISTERED, GO TO LOGIN JOIN SESSION
          DialogUtil.showErrorSnackBar(
              'Please you have already registered, kindly login to proceed');
          Future.delayed(
              const Duration(seconds: 3), () => Get.offNamed(AppRoutes.LOGIN));
        } else if (result.isFound == false && result.isRegistered == false) {
          /// USER CAN JOIN SESSION
          return DialogUtil.showDialogBox(
            title: 'Request Deduction',
            content: Text(
              'Membership of Teachers Fund is '
              'Open to GNAT Members only.',
              style: TextStyle(
                fontSize: getWidth(0.04),
              ),
            ),
            noLabel: 'Return',
            noVoidCallBack: () => Get.back(),
            yesLabel: 'Proceed',
            yesVoidCallBack: () {
              if (Get.isDialogOpen!) Get.back();
              Get.toNamed(AppRoutes.REQUESTDEDUCTION);
            },
          );
        } else if (result.isFound == true && result.isRegistered == false) {
          /// USER CAN REGISTER SESSION
          return Get.toNamed(AppRoutes.PASSCODE);
        }
      } else {
        DialogUtil.showErrorSnackBar(
          'Something went wrong.\nPlease retry shortly.',
        );
      }
    } catch (e) {
      handleException(e, null, true);
    } finally {
      loading.value = false;
    }
  }

  Future<void> requestDeduction({
    required String surname,
    required String otherNames,
    required String schoolName,
    required String district,
  }) async {
    loading.value = true;
    if (Get.isSnackbarOpen) Get.back();
    closeKeyboard();

    // todo api call and routing
    try {
//       final calRes = await requestManager.sendGraphQLMutation(
//         Constants.BASE_URL,
//         r'''
// mutation join {
//   join (command: {contribution : val1, district: "val2", phoneNumber: "val3", name: "val4", school:"val5"}) {
//     success
//     message
//   }
// }
//         ''',
//         // .replaceFirst('val1', '0')
//         // .replaceFirst('val2', district)
//         // .replaceFirst('val3', ph)
//         // .replaceFirst(
//         //   'val2',
//         // ),
//       );
//       logInfo(calRes);
//       final BaseResponse res =
//           BaseResponse.fromMap(calRes as Map<String, dynamic>);

      if (true) {
        DialogUtil.showDialogBox(
          title: 'New Request for Deduction',
          content: const Text(
            'You will receive a notification when your request is approved.',
          ),
          singleCallBack: true,
          yesLabel: 'Proceed',
          yesVoidCallBack: () {
            if (Get.isDialogOpen!) Get.back();
            Get.offAllNamed(AppRoutes.SIGNUP);
          },
        );
      } else {
        DialogUtil.showErrorSnackBar(
          'Something went wrong.\nPlease retry shortly.',
        );
      }
    } catch (e) {
      handleException(e, null, true);
    } finally {
      loading(false);
    }
  }

  Future<void> validatePasscode(String passcode) async {
    if (Get.isSnackbarOpen) Get.back();
    closeKeyboard();

    try {
      loading.value = true;
      // final calRes = await requestManager.sendGraphQLQuery(
      //   Constants.BASE_URL,
      //   r'''
      //
      //   '''
      //       .replaceFirst('val1', passcode),
      // );
      //
      // logInfo(calRes);
      //
      // final BaseResponse res =
      //     BaseResponse.fromMap(calRes as Map<String, dynamic>);

      await Future.delayed(const Duration(seconds: 2), () => {});
      // if (res.success) {
      if (true) {
        // Get.toNamed(AppRoutes.CONTRIBUTORDETAILS);

        // if (passcode != userData.passcode) {
        //   return DialogUtil.showErrorSnackBar(
        //     'Invalid Passcode.\nPlease check and try again.',
        //   );
        // }
        Get.toNamed(AppRoutes.CONTRIBUTORDETAILS);
      } else {
        DialogUtil.showErrorSnackBar(
          'Something went wrong.\nPlease retry shortly.',
        );
      }
    } catch (e) {
      handleException(e, null, true);
    } finally {
      loading(false);
    }
  }

  Future<void> validateContributorDetails(
      {String? phoneNumber, String? email}) async {
    loading(true);
    if (Get.isSnackbarOpen) Get.back();
    closeKeyboard();

    // todo api call and routing
    try {
      var response = await rootBundle.loadString('assets/sample.json');
      // final calRes = await requestManager.sendPostRequest();
      var data = jsonDecode(response);
      final BaseResponse res =
          BaseResponse.fromMap(data as Map<String, dynamic>);

      if (res.success) {
        UserData userData = UserData.fromMap(res.data);
        // if (phoneNumber != userData.phoneNumber) {
        //   return DialogUtil.showErrorSnackBar(
        //     'Invalid phone number.\nPlease check and try again.',
        //   );
        // }
        Get.toNamed(AppRoutes.OTP);
      } else {
        DialogUtil.showErrorSnackBar(
          'Something went wrong.\nPlease retry shortly.',
        );
      }
    } catch (e) {
      handleException(e, null, true);
    } finally {
      loading(false);
    }
  }

  Future<void> validateOTP({String? otp}) async {
    loading(true);
    if (Get.isSnackbarOpen) Get.back();
    closeKeyboard();

    // todo api call and routing
    try {
      var response = await rootBundle.loadString('assets/sample.json');
      var data = jsonDecode(response);
      final BaseResponse res =
          BaseResponse.fromMap(data as Map<String, dynamic>);

      if (res.success) {
        UserData userData = UserData.fromMap(res.data);

        Get.toNamed(AppRoutes.SETUPPIN);
      } else {
        DialogUtil.showErrorSnackBar(
          'Something went wrong.\nPlease retry shortly.',
        );
      }
    } catch (e) {
      handleException(e, null, true);
    } finally {
      loading(false);
    }
  }

  Future<void> setNewPin({String? pin}) async {
    loading(true);
    if (Get.isSnackbarOpen) Get.back();
    closeKeyboard();

    // todo api call and routing
    try {
      var response = await rootBundle.loadString('assets/sample.json');
      var data = jsonDecode(response);
      final BaseResponse res =
          BaseResponse.fromMap(data as Map<String, dynamic>);

      if (res.success) {
        UserData userData = UserData.fromMap(res.data);

        Get.toNamed(AppRoutes.SECURITYQUESTIONS);
      } else {
        DialogUtil.showErrorSnackBar(
          'Something went wrong.\nPlease retry shortly.',
        );
      }
    } catch (e) {
      handleException(e, null, true);
    } finally {
      loading(false);
    }
  }

  Future<void> setSecurityQuestions({
    String? question1,
    String? answer1,
    String? question2,
    String? answer2,
    String? question3,
    String? answer3,
  }) async {
    loading(true);
    if (Get.isSnackbarOpen) Get.back();
    closeKeyboard();

    // todo api call and routing
    try {
      var response = await rootBundle.loadString('assets/sample.json');
      var data = jsonDecode(response);
      final BaseResponse res =
          BaseResponse.fromMap(data as Map<String, dynamic>);

      if (res.success) {
        UserData userData = UserData.fromMap(res.data);
      } else {
        DialogUtil.showErrorSnackBar(
          'Something went wrong.\nPlease retry shortly.',
        );
      }
    } catch (e) {
      handleException(e, null, true);
    } finally {
      loading(false);
    }
  }
}
