import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachersfund/helpers/app_utils.dart';
import 'package:teachersfund/helpers/app_widgets.dart';
import 'package:teachersfund/shared/config.dart';

class SetupPINPage extends StatelessWidget {
  const SetupPINPage({Key? key}) : super(key: key);

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
                              'PIN Authentication,',
                              style: themes.textTheme.headlineLarge,
                            ),
                            Text(
                              'Enter your PIN.',
                              style: themes.textTheme.headlineMedium,
                            ),
                            verticalSpace(0.04),
                            // TextInputField(
                            //   labelText: 'PIN Number',
                            //   onTap: () {},
                            // ),
                            RepaintBoundary(
                              child: PinInput(
                                // autoFocus: !controller.checkSource(),
                                length: 4,
                                obscureText: true,
                                // focusNode: controller.pinInput2FN,
                                // controller: controller.pinPut2TEC,
                                // onCompleted: (_) => controller.submit(),
                                onCompleted: (_) {},
                                // validator: Validators.pinValidator,
                              ),
                            ),
                            verticalSpace(0.04),
                            Text(
                              'Confirm your new PIN.',
                              style: themes.textTheme.headlineMedium,
                            ),
                            verticalSpace(0.04),
                            RepaintBoundary(
                              child: PinInput(
                                // autoFocus: !controller.checkSource(),
                                length: 4,
                                obscureText: true,
                                // focusNode: controller.pinInput2FN,
                                // controller: controller.pinPut2TEC,
                                // onCompleted: (_) => controller.submit(),
                                onCompleted: (_) {},
                                // validator: Validators.pinValidator,
                              ),
                            ),
                            verticalSpace(0.04),
                            ElevatedButton(
                              onPressed: () =>
                                  Get.toNamed(AppRoutes.SECURITYQUESTIONS),
                              child: Text('Authenticate'.toUpperCase()),
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
