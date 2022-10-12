import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachersfund/helpers/app_utils.dart';
import 'package:teachersfund/helpers/app_widgets.dart';
import 'package:teachersfund/shared/config.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themes = Theme.of(context);

    return UIBody(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: getWidth(0.08)),
              height: getDisplayHeight(),
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
                              'Welcome,',
                              style: themes.textTheme.headlineLarge,
                            ),
                            Text(
                              'Sign up to begin.',
                              style: themes.textTheme.headlineMedium,
                            ),
                            verticalSpace(0.04),
                            TextInputField(
                              labelText: 'Staff ID',
                              onTap: () {},
                            ),
                            verticalSpace(0.02),
                            TextInputField(
                              labelText: 'Phone Number',
                              onTap: () {},
                            ),
                            verticalSpace(0.02),
                            TextInputField(
                              labelText: 'Email',
                              onTap: () {},
                            ),
                            verticalSpace(0.04),
                            ElevatedButton(
                              onPressed: () => Get.toNamed(
                                AppRoutes.OTP,
                                arguments: {'otpRoute': AppRoutes.SIGNUP},
                              ),
                              child: Text('Sign Up'.toUpperCase()),
                            ),
                            verticalSpace(0.04),
                            Text(
                              'Already have an account?',
                              style: themes.textTheme.displayMedium,
                              textAlign: TextAlign.center,
                            ),
                            TextButton(
                              onPressed: () => Get.offAllNamed(
                                AppRoutes.LOGIN,
                              ),
                              child: Text('Login'.toUpperCase()),
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
