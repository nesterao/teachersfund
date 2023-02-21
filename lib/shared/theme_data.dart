import 'package:flutter/material.dart';

import '../helpers/app_utils.dart';
import 'constants.dart';

class Themes {
  // LIGHT THEME DATA
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // visualDensity: VisualDensity.adaptivePlatformDensity,
    // brightness: Brightness.light,
    primaryColor: kColorLightPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    // fontFamily: GoogleFonts.roboto(),
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
      // color: kColorLightTertiary,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        // side: BorderSide(color: kLightPrimaryColor, width: 1),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        // foregroundColor: MaterialStateProperty.all<Color>(kColorLightTertiary),
        backgroundColor: MaterialStateProperty.all<Color>(kColorLightPrimary),
        // textStyle: MaterialStateProperty.all<TextStyle>(
        //   TextStyle(
        //     fontFamily: 'RobotoCondensed',
        //     letterSpacing: Get.width * 0.002,
        //     fontSize: Get.width * 0.04,
        //   ),
        // ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: getWidth(0.04)),
        ),
      ),
    ),
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
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        foregroundColor: MaterialStateProperty.all<Color>(kColorLightPrimary),
        // textStyle: MaterialStateProperty.all<TextStyle>(
        //   TextStyle(
        //     fontFamily: 'RobotoCondensed',
        //     fontSize: Get.width * 0.04,
        //     decoration: TextDecoration.underline,
        //   ),
        // ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        // side: MaterialStateProperty.all(
        //   BorderSide(color: kAccentColor, width: 1.4),
        // ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: getWidth(0.04)),
        ),
      ),
    ),
    // textSelectionTheme: TextSelectionThemeData(
    //   cursorColor: kAccentColor,
    //   selectionColor: kLightSecondaryColor.withOpacity(0.4),
    //   selectionHandleColor: kAccentColor,
    // ),

    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: kColorLightTertiary,
    //   iconColor: kAccentColor,
    //   labelStyle: TextStyle(fontSize: getWidth(0.044)),
    //   floatingLabelStyle: TextStyle(fontSize: getWidth(0.04)),
    //   // floatingLabelStyle: TextStyle(
    //   //   letterSpacing: Get.width * 0.002,
    //   //   fontSize: Get.width * 0.024,
    //   // ),
    //   enabledBorder: const OutlineInputBorder(
    //     borderSide: BorderSide(color: kColorLightPrimary),
    //   ),
    //   disabledBorder: const OutlineInputBorder(
    //     borderSide: BorderSide(color: Colors.grey),
    //   ),
    //   focusedBorder: const OutlineInputBorder(
    //     borderSide: BorderSide(color: kColorLightSecondary),
    //   ),
    //   errorBorder: const OutlineInputBorder(
    //     borderSide: BorderSide(color: kErrorColor),
    //   ),
    //   focusedErrorBorder: const OutlineInputBorder(
    //     borderSide: BorderSide(color: kErrorColor),
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

    // textTheme: const TextTheme().copyWith(
    //   displayLarge: GoogleFonts.robotoCondensed(
    //     // fontFamily: 'RobotoCondensed',
    //     fontSize: getWidth(0.044),
    //     color: kColorLightTertiary,
    //   ),
    //   displayMedium: GoogleFonts.robotoCondensed(
    //     fontSize: getWidth(0.03),
    //     color: kColorTextPrimary,
    //   ),
    //   displaySmall: GoogleFonts.roboto(
    //     // fontFamily: 'Roboto',
    //     fontSize: getWidth(0.024),
    //     color: kColorLightTertiary,
    //   ),
    //   headlineLarge: GoogleFonts.roboto(
    //     // fontFamily: 'Roboto',
    //     fontSize: getWidth(0.04),
    //     color: kColorTextPrimary,
    //     fontWeight: FontWeight.bold,
    //   ),
    //   headlineMedium: GoogleFonts.robotoCondensed(
    //     // fontFamily: 'RobotoCondensed',
    //     fontSize: getWidth(0.032),
    //     color: kColorTextPrimary,
    //   ),
    //   headlineSmall: GoogleFonts.robotoCondensed(
    //     // fontFamily: 'RobotoCondensed',
    //     fontSize: getWidth(0.06),
    //     color: kColorLightPrimary,
    //     fontWeight: FontWeight.bold,
    //   ),
    //   bodyLarge: GoogleFonts.roboto(
    //     // fontFamily: 'Roboto',
    //     fontSize: getWidth(0.04),
    //     color: kColorLightPrimary,
    //   ),
    //   bodyMedium: GoogleFonts.robotoCondensed(
    //     // fontFamily: 'RobotoCondensed',
    //     fontSize: getWidth(0.04),
    //     color: kColorLightPrimary,
    //   ),
    //   bodySmall: GoogleFonts.roboto(
    //     // fontFamily: 'Roboto',
    //     fontSize: getWidth(0.02),
    //     color: kColorTextPrimary,
    //   ),
    //   labelLarge: GoogleFonts.roboto(
    //     // fontFamily: 'Roboto',
    //     fontSize: getWidth(0.044),
    //     letterSpacing: getWidth(0.002),
    //     color: kColorLightPrimary,
    //   ),
    //   labelMedium: GoogleFonts.roboto(
    //     // fontFamily: 'Roboto',
    //     fontSize: getWidth(0.052),
    //     color: kColorTextPrimary,
    //   ),
    //   labelSmall: GoogleFonts.roboto(
    //     // fontFamily: 'Roboto',
    //     fontSize: getWidth(0.044),
    //     letterSpacing: getWidth(0.003),
    //     color: kColorLightPrimary,
    //   ),
    //   titleMedium: GoogleFonts.roboto(
    //     // fontFamily: 'Roboto',
    //     fontSize: getWidth(0.032),
    //     color: kColorLightPrimary,
    //   ),
    //   titleSmall: GoogleFonts.roboto(
    //     // fontFamily: 'Roboto',
    //     fontSize: getWidth(0.032),
    //     color: kColorLightPrimary,
    //     decoration: TextDecoration.underline,
    //   ),
    // ),
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
