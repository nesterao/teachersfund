import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teachersfund/controllers/auth_controller.dart';
import 'package:teachersfund/helpers/app_utils.dart';
import 'package:teachersfund/widgets/app_widgets.dart';

import '../shared/common.dart';

class PINPage extends StatelessWidget {
  PINPage({Key? key}) : super(key: key);

  final AuthController authController = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController pinTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData themes = Theme.of(context);

    return PageWithBackground(
      appBar: appBar(implyLeading: true),
      body: SizedBox(
        height: getDisplayHeight(appBar: true),
        width: getDisplayWidth(),
        child: SingleChildScrollView(
          reverse: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: getWidth(0.04)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints.tight(
                  Size(getWidth(0.4), getWidth(0.4)),
                ),
                child: logo(),
              ),
              Card(
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.all(getWidth(0.08)),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'PIN Authentication',
                          style: themes.textTheme.labelLarge,
                        ),
                        Text(
                          'Enter your PIN.',
                          style: themes.textTheme.labelMedium,
                        ),
                        verticalSpace(0.04),
                        PinInput(
                          // autoFocus: true,
                          length: 4,
                          obscureText: true,
                          validator: fourDigitValidator,
                          controller: pinTEC,
                          inputFormatters: <TextInputFormatter>[
                            // LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.allow(RegExp('[0-9-]')),
                            FilteringTextInputFormatter.deny(RegExp(r'[,]')),
                            FilteringTextInputFormatter.deny(RegExp(r'[.]')),
                          ],
                        ),
                        verticalSpace(0.01),
                        Obx(
                          () => UiButton(
                            busy: authController.loading.value,
                            text: 'Authenticate',
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState?.save();
                                //authController.validatePIN(pin: pinTEC.text)
                                await authController.login(pinTEC.text);
                              }
                            },
                          ),
                        ),
                        // ElevatedButton(
                        //   onPressed: () => Get.offAllNamed(AppRoutes.MAIN),
                        //   child: Text('Authenticate'.toUpperCase()),
                        // ),
                        verticalSpace(0.03),
                        Text(
                          'Forgot your PIN?',
                          style: themes.textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(0.01),
                        TextButton(
                          onPressed: () {},
                          child: Text('Reset PIN.'.toUpperCase()),
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
      hasFooter: true,
    );
  }
}
