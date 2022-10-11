import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachersfund/helpers/app_utils.dart';
import 'package:teachersfund/helpers/app_widgets.dart';
import 'package:teachersfund/shared/config.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themes = Theme.of(context);

    return UIBody(
      child: Scaffold(
        appBar: appBar(showBackButton: true),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: getWidth(0.08)),
              height: getDisplayHeight(appBar: true),
              width: getDisplayWidth(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(child: logo()),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        getWidth(0.08),
                        getWidth(0.08),
                        getWidth(0.08),
                        getWidth(0.04),
                      ),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'OTP Verification,',
                              style: themes.textTheme.headlineLarge,
                            ),
                            Text(
                              'Enter your OTP code.',
                              style: themes.textTheme.headlineMedium,
                            ),
                            verticalSpace(0.04),
                            PinInput(
                              length: 5,
                              autoFocus: true,
                              obscureText: false,
                              // enablePinAutofill: controller.isLoading.value,
                              // focusNode: controller.otpVerificationFN,
                              // controller: controller.otpVerificationTEC,
                              // validator: Validators.otpValidator,
                              onCompleted: (_) {
                                // controller.submit();
                                return;
                              },
                            ),
                            verticalSpace(0.04),
                            ElevatedButton(
                              onPressed: () {
                                print(Get.arguments['isSignUp']);
                                Get.arguments['isSignUp'];

                                Get.arguments['isSignUp']
                                    ? Get.toNamed(AppRoutes.SIGNUP)
                                    : Get.toNamed(AppRoutes.HOME);
                              },
                              child: Text('Verify'.toUpperCase()),
                            ),
                            verticalSpace(0.04),
                            Text(
                              'Resend OTP Code',
                              style: themes.textTheme.displayMedium,
                              textAlign: TextAlign.center,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Send Code Via Email'),
                            ),
                            verticalSpace(0.04),
                            Text(
                              '©Teachers’ Fund of GNAT - 2022.',
                              style: themes.textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
