import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachersfund/helpers/app_utils.dart';
import 'package:teachersfund/helpers/app_widgets.dart';
import 'package:teachersfund/shared/config.dart';
import 'package:teachersfund/shared/constants.dart';

class PinPage extends StatelessWidget {
  const PinPage({Key? key}) : super(key: key);

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
                              'PIN Authentication,',
                              style: themes.textTheme.headlineLarge,
                            ),
                            Text(
                              'Enter your PIN.',
                              style: themes.textTheme.headlineMedium,
                            ),
                            verticalSpace(0.02),
                            TextInputField(
                              labelText: 'PIN Number',
                              onTap: () {},
                            ),
                            verticalSpace(0.04),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Login'.toUpperCase()),
                            ),
                            verticalSpace(0.04),
                            Text(
                              'Don\'t have an account?',
                              style: themes.textTheme.displayMedium,
                              textAlign: TextAlign.center,
                            ),
                            TextButton(
                              onPressed: () => Get.offAndToNamed(
                                AppRoutes.SIGNUP,
                              ),
                              child: Text('Sign Up'.toUpperCase()),
                            ),
                            verticalSpace(0.04),
                            Text(
                              '©Teachers’ Fund of GNAT - 2022.',
                              style: themes.textTheme.bodySmall?.copyWith(
                                color: kColorTextPrimary,
                              ),
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
