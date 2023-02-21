import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachersfund/data/mock_data.dart';

import '../helpers/request_manager.dart';
import '../shared/config.dart';

class MembershipController extends GetxController {
  RxBool loading = false.obs;
  final RequestManager requestManager = RequestManager();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchForm({String? form, required BuildContext context}) async {
    switch (form) {
      case AppForms.MEMBERSHIP_UPDATE:
        Get.toNamed(AppRoutes.MEMBERSHIP_UPDATE, preventDuplicates: true);
        break;

      case AppForms.CONTACT_DETAILS:
        Get.toNamed(AppRoutes.CONTACT_DETAILS, preventDuplicates: true);
        break;

      case AppForms.BANK_DETAILS:
        Get.toNamed(AppRoutes.BANK_DETAILS, preventDuplicates: true);
        break;

      case AppForms.BENEFICIARIES:
        Get.toNamed(AppRoutes.BENEFICIARIES, preventDuplicates: true);
        break;

      case AppForms.MEMBERSHIP_REINSTATEMENT:
        Get.toNamed(AppRoutes.MEMBERSHIP_REINSTATEMENT,
            preventDuplicates: true);
        break;

      case AppForms.REQUEST_FUND_ID:
        Get.toNamed(AppRoutes.REQUEST_FUND_ID, preventDuplicates: true);
        break;

      default:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('WIP. Will be available soon'),
          ),
        );
    }
  }
}
