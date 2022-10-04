import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachersfund/pages/home_page.dart';
import 'package:teachersfund/pages/login_page.dart';
import 'package:teachersfund/pages/signup_page.dart';

import 'constants.dart';

bool isLoggedIn() {
  // final uData = GetStorage().read(Constants.USER_DATA);
  // final uData = null;

  // if (uData == null) {
  //   return false;
  // }
  // UserData user = UserData.fromMap(uData);

  // return user != null && !JwtDecoder.isExpired(user?.token);
  // final String token = storage.hasData('user') ? user[Constants.TOKEN_KEY] : '';
  // final String token = user.token; //?? '';
  return false /*!GetUtils.isNullOrBlank(token)! && !JwtDecoder.isExpired(token)*/;
}

class AppRoutes {
  static const String INIT = '/';
  static const String SIGNUP = '/SignUpPage';
  static const String LOGIN = '/LoginPage';
  static const String HOME = '/HomePage';
}

List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
  GetPage<dynamic>(name: '/', page: () => const SignUpPage()),
  GetPage(
    name: AppRoutes.LOGIN,
    page: () => const LoginPage(),
    transition: Transition.topLevel,
    transitionDuration: const Duration(milliseconds: 300),
    curve: Curves.easeInOut,
  ),
  GetPage(
    name: AppRoutes.SIGNUP,
    page: () => const SignUpPage(),
    transition: Transition.topLevel,
    transitionDuration: const Duration(milliseconds: 300),
    curve: Curves.easeInOut,
  ),
  GetPage(
    name: AppRoutes.HOME,
    page: () => isLoggedIn() ? const HomePage() : const LoginPage(),
    transition: Transition.topLevel,
    transitionDuration: const Duration(milliseconds: 300),
    curve: Curves.easeInOut,
  ),
];

class Themes {
  // LIGHT THEME DATA
  static final ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primaryColor: kLightTertiaryColor,
    scaffoldBackgroundColor: kContentColorLightTheme,
    // bottomAppBarColor: kLightPrimaryColor,
    // dividerColor: kAccentColor,
    // appBarTheme: AppBarTheme(
    //   color: kLightPrimaryColor,
    //   // shadowColor: Colors.transparent,
    //   centerTitle: true,
    //   iconTheme: const IconThemeData(color: kLightTertiaryColor),
    //   titleTextStyle: TextStyle(
    //     fontFamily: 'Roboto-Medium',
    //     fontWeight: FontWeight.w500,
    //     fontSize: Get.width * 0.04,
    //     color: kLightTertiaryColor,
    //   ),
    // ),
    // listTileTheme: const ListTileThemeData(
    //   tileColor: kLightPrimaryColor,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(8)),
    //     side: BorderSide(color: kLightSecondaryColor, width: 0.8),
    //   ),
    // ),
    // dialogTheme: DialogTheme(
    //   backgroundColor: kLightPrimaryColor,
    //   titleTextStyle: TextStyle(
    //     color: kLightPrimaryColor,
    //     fontSize: Get.width * 0.04,
    //     fontFamily: 'Roboto',
    //     fontWeight: FontWeight.w500,
    //   ),
    // ),
    cardTheme: const CardTheme(
      color: kLightTertiaryColor,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        // side: BorderSide(color: kLightPrimaryColor, width: 1),
      ),
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //     foregroundColor: MaterialStateProperty.all<Color>(kAccentColor),
    //     backgroundColor: MaterialStateProperty.all<Color>(kLightPrimaryColor),
    //     textStyle: MaterialStateProperty.all<TextStyle>(
    //       TextStyle(
    //         fontFamily: 'RobotoCondensed',
    //         letterSpacing: Get.width * 0.002,
    //         fontSize: Get.width * 0.04,
    //       ),
    //     ),
    //     shape: MaterialStateProperty.all<OutlinedBorder>(
    //       const RoundedRectangleBorder(
    //         borderRadius: BorderRadius.all(Radius.circular(4)),
    //       ),
    //     ),
    //     padding: MaterialStateProperty.all(
    //       const EdgeInsets.symmetric(vertical: 14),
    //     ),
    //   ),
    // ),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: ButtonStyle(
    //     foregroundColor: MaterialStateProperty.all<Color>(kLightPrimaryColor),
    //     backgroundColor: MaterialStateProperty.all<Color>(kLightTertiaryColor),
    //     textStyle: MaterialStateProperty.all<TextStyle>(
    //       TextStyle(
    //         fontFamily: 'RobotoCondensed',
    //         letterSpacing: Get.width * 0.002,
    //         fontSize: Get.width * 0.04,
    //       ),
    //     ),
    //     shape: MaterialStateProperty.all<OutlinedBorder>(
    //       const RoundedRectangleBorder(
    //         borderRadius: BorderRadius.all(Radius.circular(4)),
    //       ),
    //     ),
    //     side: MaterialStateProperty.all(
    //       const BorderSide(color: kAccentColor, width: 1),
    //     ),
    //     padding:
    //         MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 14)),
    //   ),
    // ),
    // textButtonTheme: TextButtonThemeData(
    //   style: ButtonStyle(
    //     elevation: MaterialStateProperty.all<double>(0),
    //     foregroundColor: MaterialStateProperty.all<Color>(kLightPrimaryColor),
    //     textStyle: MaterialStateProperty.all<TextStyle>(
    //       TextStyle(
    //         fontFamily: 'RobotoCondensed',
    //         fontSize: Get.width * 0.04,
    //         decoration: TextDecoration.underline,
    //       ),
    //     ),
    //     shape: MaterialStateProperty.all<OutlinedBorder>(
    //       const RoundedRectangleBorder(
    //         borderRadius: BorderRadius.all(Radius.circular(4)),
    //       ),
    //     ),
    //     // side: MaterialStateProperty.all(
    //     //   BorderSide(color: kAccentColor, width: 1.4),
    //     // ),
    //     // padding: MaterialStateProperty.all(EdgeInsets.all(14)),
    //   ),
    // ),
    // textSelectionTheme: TextSelectionThemeData(
    //   cursorColor: kAccentColor,
    //   selectionColor: kLightSecondaryColor.withOpacity(0.4),
    //   selectionHandleColor: kAccentColor,
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: kLightTertiaryColor,
    //   iconColor: kLightPrimaryColor,
    //   // alignLabelWithHint: true,
    //   suffixStyle: TextStyle(
    //     fontFamily: 'Roboto',
    //     fontSize: Get.width * 0.044,
    //     letterSpacing: Get.width * 0.003,
    //     // color: kLightPrimaryColor,
    //   ),
    //   floatingLabelStyle: TextStyle(
    //     letterSpacing: Get.width * 0.002,
    //     fontSize: Get.width * 0.024,
    //   ),
    //   enabledBorder: const UnderlineInputBorder(
    //     borderSide: BorderSide(
    //       color: kLightPrimaryColor,
    //       width: 2,
    //     ),
    //   ),
    //   disabledBorder: const UnderlineInputBorder(
    //     borderSide: BorderSide(
    //       color: Colors.grey,
    //       width: 2,
    //     ),
    //   ),
    //   focusedBorder: const UnderlineInputBorder(
    //     borderSide: BorderSide(
    //       color: kAccentColor,
    //       width: 2,
    //     ),
    //   ),
    //   errorBorder: const UnderlineInputBorder(
    //     borderSide: BorderSide(
    //       color: kErrorColor,
    //       width: 2,
    //     ),
    //   ),
    // ),
    // iconTheme: IconThemeData(
    //   color: kLightSecondaryColor,
    //   size: Get.width * 0.06,
    // ),
    // checkboxTheme: CheckboxThemeData(
    //   checkColor: MaterialStateProperty.all<Color>(kLightTertiaryColor),
    //   overlayColor: MaterialStateProperty.all<Color>(kLightSecondaryColor),
    //   fillColor: MaterialStateProperty.all<Color>(kLightSecondaryColor),
    // ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontSize: Get.width * 0.044,
        color: kLightTertiaryColor,
      ),
      displayMedium: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontSize: Get.width * 0.05,
        color: kLightPrimaryColor,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: Get.width * 0.04,
        color: kLightTertiaryColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontSize: Get.width * 0.06,
        color: kLightPrimaryColor,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: Get.width * 0.04,
        color: kLightPrimaryColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontSize: Get.width * 0.04,
        color: kLightPrimaryColor,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: Get.width * 0.032,
        color: kLightTertiaryColor,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Roboto',
        fontSize: Get.width * 0.044,
        letterSpacing: Get.width * 0.002,
        color: kLightPrimaryColor,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: Get.width * 0.032,
        color: kLightPrimaryColor,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: Get.width * 0.032,
        color: kLightPrimaryColor,
        decoration: TextDecoration.underline,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: Get.width * 0.044,
        letterSpacing: Get.width * 0.003,
        color: kLightPrimaryColor,
      ),
    ),
  );

  // DARK THEME DATA
  // static final ThemeData darkTheme = ThemeData(
  //   visualDensity: VisualDensity.adaptivePlatformDensity,
  //   brightness: Brightness.dark,
  //   primaryColor: kAccentColor,
  //   scaffoldBackgroundColor: kLightTertiaryColor.withOpacity(1),
  //   bottomAppBarColor: kDarkPrimaryColor,
  //   dividerColor: kAccentColor,
  //   appBarTheme: AppBarTheme(
  //     color: kDarkPrimaryColor,
  //     centerTitle: true,
  //     // shadowColor: Colors.transparent,
  //     iconTheme: const IconThemeData(color: kDarkTertiaryColor),
  //     titleTextStyle: TextStyle(
  //       fontFamily: 'Roboto-Medium',
  //       fontWeight: FontWeight.w500,
  //       fontSize: Get.width * 0.04,
  //       color: kDarkTertiaryColor,
  //     ),
  //   ),
  //   listTileTheme: const ListTileThemeData(
  //     tileColor: kLightPrimaryColor,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(8)),
  //       side: BorderSide(color: kDarkSecondaryColor, width: 0.8),
  //     ),
  //   ),
  //   dialogTheme: DialogTheme(
  //     backgroundColor: kDarkPrimaryColor,
  //     titleTextStyle: TextStyle(
  //       color: kDarkSecondaryColor,
  //       fontSize: Get.width * 0.04,
  //       fontFamily: 'Roboto',
  //       fontWeight: FontWeight.w500,
  //     ),
  //   ),
  //   cardTheme: const CardTheme(
  //     color: kDarkPrimaryColor,
  //     margin: EdgeInsets.all(8),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(8)),
  //     ),
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ButtonStyle(
  //       foregroundColor: MaterialStateProperty.all<Color>(kAccentColor),
  //       backgroundColor: MaterialStateProperty.all<Color>(kDarkPrimaryColor),
  //       textStyle: MaterialStateProperty.all<TextStyle>(
  //         TextStyle(
  //           fontFamily: 'RobotoCondensed',
  //           letterSpacing: Get.width * 0.002,
  //           fontSize: Get.width * 0.04,
  //         ),
  //       ),
  //       shape: MaterialStateProperty.all<OutlinedBorder>(
  //         const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(4)),
  //         ),
  //       ),
  //       padding: MaterialStateProperty.all(
  //         const EdgeInsets.symmetric(vertical: 16),
  //       ),
  //     ),
  //   ),
  //   outlinedButtonTheme: OutlinedButtonThemeData(
  //     style: ButtonStyle(
  //       elevation: MaterialStateProperty.all<double>(2),
  //       backgroundColor: MaterialStateProperty.all<Color>(
  //         kDarkPrimaryColor.withOpacity(0.5),
  //       ),
  //       foregroundColor: MaterialStateProperty.all<Color>(kDarkTertiaryColor),
  //       textStyle: MaterialStateProperty.all<TextStyle>(
  //         TextStyle(
  //           fontFamily: 'RobotoCondensed',
  //           letterSpacing: Get.width * 0.002,
  //           fontSize: Get.width * 0.04,
  //         ),
  //       ),
  //       shape: MaterialStateProperty.all<OutlinedBorder>(
  //         const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(4)),
  //         ),
  //       ),
  //       side: MaterialStateProperty.all(
  //         const BorderSide(color: kAccentColor, width: 1.6),
  //       ),
  //       padding:
  //           MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
  //     ),
  //   ),
  //   textButtonTheme: TextButtonThemeData(
  //     style: ButtonStyle(
  //       elevation: MaterialStateProperty.all<double>(0),
  //       foregroundColor: MaterialStateProperty.all<Color>(kDarkSecondaryColor),
  //       textStyle: MaterialStateProperty.all<TextStyle>(
  //         TextStyle(
  //           fontFamily: 'RobotoCondensed',
  //           fontSize: Get.width * 0.04,
  //           color: kAccentColor,
  //           decoration: TextDecoration.underline,
  //         ),
  //       ),
  //       shape: MaterialStateProperty.all<OutlinedBorder>(
  //         const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(4)),
  //         ),
  //       ),
  //       // side: MaterialStateProperty.all(
  //       //   BorderSide(color: kAccentColor, width: 1.4),
  //       // ),
  //     ),
  //   ),
  //   textSelectionTheme: TextSelectionThemeData(
  //     cursorColor: kAccentColor,
  //     selectionColor: kDarkSecondaryColor.withOpacity(0.4),
  //     selectionHandleColor: kAccentColor,
  //   ),
  //   inputDecorationTheme: InputDecorationTheme(
  //     filled: true,
  //     iconColor: kAccentColor,
  //     suffixIconColor: kAccentColor,
  //     fillColor: kDarkPrimaryColor.withOpacity(0.88),
  //     floatingLabelStyle: TextStyle(
  //       letterSpacing: Get.width * 0.002,
  //       fontSize: Get.width * 0.024,
  //     ),
  //     enabledBorder: const UnderlineInputBorder(
  //       borderSide: BorderSide(
  //         color: kDarkSecondaryColor,
  //         width: 2,
  //       ),
  //     ),
  //     disabledBorder: const UnderlineInputBorder(
  //       borderSide: BorderSide(
  //         color: Colors.grey,
  //         width: 2,
  //       ),
  //     ),
  //     focusedBorder: const UnderlineInputBorder(
  //       borderSide: BorderSide(
  //         color: kAccentColor,
  //         width: 2,
  //       ),
  //     ),
  //     errorBorder: const UnderlineInputBorder(
  //       borderSide: BorderSide(
  //         color: kErrorColor,
  //         width: 2,
  //       ),
  //     ),
  //   ),
  //   iconTheme: IconThemeData(
  //     color: kAccentColor,
  //     size: Get.width * 0.06,
  //   ),
  //   checkboxTheme: CheckboxThemeData(
  //     checkColor: MaterialStateProperty.all<Color>(kDarkPrimaryColor),
  //     fillColor: MaterialStateProperty.all<Color>(kAccentColor),
  //   ),
  //   textTheme: TextTheme(
  //     headline1: TextStyle(
  //       fontFamily: 'RobotoCondensed',
  //       fontSize: Get.width * 0.044,
  //       color: kDarkTertiaryColor,
  //     ),
  //     headline2: TextStyle(
  //       fontFamily: 'RobotoCondensed',
  //       fontSize: Get.width * 0.05,
  //       color: kDarkSecondaryColor,
  //     ),
  //     headline3: TextStyle(
  //       fontFamily: 'RobotoCondensed',
  //       fontSize: Get.width * 0.04,
  //       fontWeight: FontWeight.bold,
  //       color: kAccentColor,
  //     ),
  //     headline4: TextStyle(
  //       fontFamily: 'RobotoCondensed',
  //       fontSize: Get.width * 0.06,
  //       fontWeight: FontWeight.bold,
  //       color: kDarkSecondaryColor,
  //     ),
  //     bodyText1: TextStyle(
  //       fontFamily: 'Roboto',
  //       fontSize: Get.width * 0.04,
  //       color: kDarkTertiaryColor,
  //     ),
  //     bodyText2: TextStyle(
  //       fontFamily: 'RobotoCondensed',
  //       fontSize: Get.width * 0.04,
  //       color: kDarkTertiaryColor,
  //     ),
  //     button: TextStyle(
  //       fontSize: Get.width * 0.044,
  //       letterSpacing: Get.width * 0.001,
  //       color: kDarkTertiaryColor,
  //     ),
  //     subtitle1: TextStyle(
  //       fontFamily: 'Roboto',
  //       fontSize: Get.width * 0.032,
  //       color: kDarkTertiaryColor,
  //     ),
  //     subtitle2: TextStyle(
  //       fontFamily: 'Roboto',
  //       fontSize: Get.width * 0.032,
  //       color: kDarkTertiaryColor,
  //       decoration: TextDecoration.underline,
  //     ),
  //     caption: TextStyle(
  //       fontFamily: 'RobotoCondensed',
  //       fontSize: Get.width * 0.03,
  //       color: kAccentColor,
  //     ),
  //     overline: TextStyle(
  //       fontFamily: 'Roboto',
  //       fontSize: Get.width * 0.044,
  //       letterSpacing: Get.width * 0.003,
  //       color: kDarkTertiaryColor,
  //     ),
  //   ),
  // );
}
