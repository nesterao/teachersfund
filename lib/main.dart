import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:teachersfund/controllers/auth_controller.dart';
import 'package:teachersfund/shared/config.dart';
import 'package:teachersfund/widgets/app_widgets.dart';

import 'controllers/contribution_controller.dart';
import 'controllers/enquiry_controller.dart';
import 'controllers/loans_controller.dart';
import 'controllers/membership_controller.dart';
import 'shared/theme_data.dart';

//staff id: 1217707, pin: 1357
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: <SystemUiOverlay>[SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  );
  //SystemChannels.textInput.invokeMethod('TextInput.hide');

  // debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final authController = Get.put(AuthController());
  final membershipController =
      Get.lazyPut<MembershipController>(() => MembershipController());
  final contributionController =
      Get.lazyPut<ContributionController>(() => ContributionController());
  final loansController = Get.lazyPut<LoansController>(() => LoansController());
  final enquiryController =
      Get.lazyPut<EnquiryController>(() => EnquiryController());

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      // themeMode: ThemeMode.system,
      // initialRoute: !isLoggedIn() ? AppRoutes.LOGIN : AppRoutes.MAIN,
      initialRoute:  AppRoutes.LOGIN ,
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      getPages: pages,
      home: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const PageWithBackground(hasFooter: true),
      ),
    );
  }
}
