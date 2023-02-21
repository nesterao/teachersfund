import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../helpers/app_utils.dart';
import '../models/core_models.dart';
import '../pages/login_page.dart';
import '../pages/pin_page.dart';
import '../pages/sign_up_page.dart';
import 'constants.dart';

bool isLoggedIn() {
  final uData = GetStorage().read(Constants.USER_DATA);
  if (uData == null) return false;
  UserData user = UserData.fromMap(uData);
  return !GetUtils.isNullOrBlank(user.token)! &&
      !JwtDecoder.isExpired(user.token);
}

dynamic get userData => GetStorage().read(Constants.USER_DATA);

Map<String, String> get authHeader {
  final uData = GetStorage().read(Constants.USER_DATA);
  final token = uData[Constants.TOKEN_KEY];
  // logInfo('token = $token');
  return getHeaders(token ?? '');
}

class AppRoutes {
  static const String INIT = '/';
  static const String SIGNUP = '/SignUpPage';
  static const String LOGIN = '/LoginPage';
  static const String PIN = '/PINPage';
  static const String PASSCODE = '/PasscodePage';
  static const String OTP = '/OTPPage';
  static const String CONTRIBUTORDETAILS = '/ContributorDetailsPage';
  static const String REQUESTDEDUCTION = '/RequestDeductionPage';
  static const String SETUPPIN = '/SetupPINPage';
  static const String SECURITYQUESTIONS = '/SecurityQuestions';
  static const String MAIN = '/MainPage';
  static const String HOME = '/HomePage';
  static const String CONTRIBUTION = '/ContributionPage';
  static const String LOAN = '/LoanPage';
  static const String HELP = '/HelpPage';
  static const String SAMPLEFORM = '/SampleForm';
  static const String CHECK_BALANCE = '/CheckBalance';
  static const String REFUND_CONTRIBUTION = '/RefundContribution';
  static const String PAY_CONTRIBUTION = '/PayContribution';
  static const String UPDATE_CONTRIBUTION = '/UpdateContribution';
  static const String CONTRIBUTION_STATEMENT = '/ContributionStatement';
  static const String MEMBERSHIP_UPDATE = '/MembershipUpdate';
  static const String CONTACT_DETAILS = '/ContactDetails';
  static const String BANK_DETAILS = '/BankDetails';
  static const String BENEFICIARIES = '/Beneficiaries';
  static const String MEMBERSHIP_REINSTATEMENT = '/MembershipReinstatement';
  static const String REQUEST_FUND_ID = '/RequestFundID';
  static const String LOAN_CALCULATOR = '/LoanCalculator';
  static const String LOAN_APPLICATIONS = '/LoanApplications';
  static const String LOAN_BALANCE = '/LoanBalance';
  static const String LOAN_STATEMENT = '/LoanStatement';
  static const String ENQUIRY_COMPLAINTS = '/EnquiryComplaints';
}

List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
  // GetPage<dynamic>(
  //   name: '/',
  //   page: () => LoginPage(),
  // ),
  GetPage(
    name: AppRoutes.SIGNUP,
    page: () => SignUpPage(),
    transition: Transition.leftToRight,
    transitionDuration: const Duration(milliseconds: 400),
    curve: Curves.easeInOut,
  ),
  GetPage(
    name: AppRoutes.LOGIN,
    page: () => LoginPage(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
    curve: Curves.easeInOut,
  ),
  GetPage(
    name: AppRoutes.PIN,
    page: () => PINPage(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
    curve: Curves.easeInOut,
  ),
];
