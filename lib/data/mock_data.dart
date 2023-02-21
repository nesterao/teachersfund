import 'package:flutter/material.dart';
import 'package:teachersfund/helpers/helper_models.dart';

List<MenuItems> menuItems = [
  MenuItems(
    label: 'MY MEMBERSHIP',
    icon: Icons.person_pin_outlined,
    description: 'Lorem',
    color: const Color.fromRGBO(2, 195, 196, 1),
  ),
  MenuItems(
    label: 'MY LOANS',
    icon: Icons.money,
    description: 'Lorem',
    color: const Color.fromRGBO(82, 59, 237, 1),
  ),
  MenuItems(
    label: 'MY CONTRIBUTION',
    icon: Icons.clean_hands_sharp,
    description: 'Lorem',
    color: const Color.fromRGBO(53, 56, 195, 1),
  ),
  MenuItems(
    label: 'MY ENQUIRY/COMPLAINTS',
    icon: Icons.manage_search_sharp,
    description: 'Lorem',
    color: const Color.fromRGBO(13, 144, 164, 1),
  ),
];

List<SubMenuItem> membershipItems = [
  SubMenuItem(
    label: 'REQUEST FOR FUND ID',
    image: 'assets/menu_icons/fund_id_registration.png',
  ),
  SubMenuItem(
    label: 'MEMBERSHIP UPDATE',
    image: 'assets/menu_icons/member_details_update.png',
  ),
  SubMenuItem(
    label: 'CONTACT DETAILS',
    image: 'assets/menu_icons/check_fund_id.png',
  ),
  SubMenuItem(
    label: 'BANK DETAILS',
    image: 'assets/menu_icons/bank_details.png',
  ),
  SubMenuItem(
    label: 'BENEFICIARIES',
    image: 'assets/menu_icons/beneficiaries.png',
  ),
  SubMenuItem(
    label: 'MEMBERSHIP REINSTATEMENT',
    image: 'assets/menu_icons/membership_reinstatement.png',
  ),
];

List<SubMenuItem> loanItems = [
  SubMenuItem(
    label: 'APPLY FOR LOAN',
    image: 'assets/menu_icons/apply_for_loan.png',
  ),
  SubMenuItem(
    label: 'LOAN STATEMENT',
    image: 'assets/menu_icons/loan_statement.png',
  ),
  SubMenuItem(
    label: 'LOAN CALCULATOR',
    image: 'assets/menu_icons/loan_calculator.png',
  ),
  SubMenuItem(
    label: 'LOAN BALANCE',
    image: 'assets/menu_icons/loan_balance.png',
  ),
];

List<SubMenuItem> contributionItems = [
  SubMenuItem(
    label: 'CHECK BALANCE',
    image: 'assets/menu_icons/check_balance.png',
  ),
  SubMenuItem(
    label: 'UPDATE CONTRIBUTION',
    image: 'assets/menu_icons/update_contribution.png',
  ),
  SubMenuItem(
    label: 'CONTRIBUTION STATEMENT',
    image: 'assets/menu_icons/contribution_statement.png',
  ),
  SubMenuItem(
    label: 'PAY CONTRIBUTION',
    image: 'assets/menu_icons/pay_contribution.png',
  ),
  SubMenuItem(
    label: 'REFUND',
    image: 'assets/menu_icons/refund.png',
  ),
  SubMenuItem(
    label: 'CONTRIBUTION INFORMATION',
    image: 'assets/menu_icons/contribution_information.png',
  ),
];

List<SubMenuItem> enquiryItems = [
  SubMenuItem(
    label: 'CHAT',
    image: 'assets/menu_icons/chat.png',
  ),
  // SubMenuItem(
  //   label: 'INCREMENT REQUEST',
  //   image: 'assets/menu_icons/increment_request.png',
  // ),
  SubMenuItem(
    label: 'ENQUIRY AND COMPLAINTS',
    image: 'assets/menu_icons/related_issues.png',
  ),
  // SubMenuItem(
  //   label: 'REFUND',
  //   image: 'assets/menu_icons/refund.png',
  // ),
  // SubMenuItem(
  //   label: 'SAMPLE FORM',
  //   image: 'assets/menu_icons/contribution_increment.png',
  // ),
];

class AppForms {
  static const String CHECK_BALANCE = 'CHECK BALANCE';
  static const String REFUND_CONTRIBUTION = 'REFUND';
  static const String PAY_CONTRIBUTION = 'PAY CONTRIBUTION';
  static const String UPDATE_CONTRIBUTION = 'UPDATE CONTRIBUTION';
  static const String CONTRIBUTION_STATEMENT = 'CONTRIBUTION STATEMENT';
  static const String MEMBERSHIP_UPDATE = 'MEMBERSHIP UPDATE';
  static const String CONTACT_DETAILS = 'CONTACT DETAILS';
  static const String BANK_DETAILS = 'BANK DETAILS';
  static const String BENEFICIARIES = 'BENEFICIARIES';
  static const String MEMBERSHIP_REINSTATEMENT = 'MEMBERSHIP REINSTATEMENT';
  static const String REQUEST_FUND_ID = 'REQUEST FOR FUND ID';
  static const String LOAN_CALCULATOR = 'LOAN CALCULATOR';
  static const String LOAN_APPLICATIONS = 'APPLY FOR LOAN';
  static const String LOAN_BALANCE = 'LOAN BALANCE';
  static const String LOAN_STATEMENT = 'LOAN STATEMENT';
  static const String ENQUIRY_COMPLAINTS = 'ENQUIRY AND COMPLAINTS';
}
