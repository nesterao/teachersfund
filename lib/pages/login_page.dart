import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachersfund/helpers/app_utils.dart';
import 'package:teachersfund/shared/config.dart';
import 'package:teachersfund/widgets/app_widgets.dart';

import '../controllers/auth_controller.dart';
import '../shared/common.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final AuthController authController = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController staffNumberTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData themes = Theme.of(context);

    return PageWithBackground(
      body: SizedBox(
        height: getDisplayHeight(),
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
              verticalSpace(0.02),
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
                          'Lets Go!',
                          style: themes.textTheme.labelLarge,
                        ),
                        verticalSpace(0.04),
                        TextInputField(
                          labelText: 'Staff ID',
                          validator: requiredValidator,
                          controller: staffNumberTEC,

                          // keyboardType: TextInputType.number,
                          // inputFormatter: [
                          //   LengthLimitingTextInputFormatter(4),
                          //   FilteringTextInputFormatter.allow(RegExp('[0-9-]')),
                          //   FilteringTextInputFormatter.deny(RegExp(r'^[0]+')),
                          //   FilteringTextInputFormatter.deny(RegExp(r'[,]')),
                          //   FilteringTextInputFormatter.deny(RegExp(r'[.]')),
                          // ],
                        ),
                        verticalSpace(0.04),
                        Obx(
                          () => UiButton(
                            busy: authController.loading.value,
                            text: 'Login',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState?.save();
                                authController.stuffId.value =
                                    staffNumberTEC.text;
                                Get.toNamed(AppRoutes.PIN);
                              }
                            },
                            // onPressed: () => {
                            //   if (formKey.currentState!.validate())
                            //     {
                            //       formKey.currentState?.save();
                            //       authController.validateLogin(
                            //         staffID: staffNumberTEC.text,
                            //       )
                            //     }
                            // },
                          ),
                        ),
                        verticalSpace(0.03),
                        Text(
                          'Don\'t have an account?',
                          style: themes.textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(0.01),
                        TextButton(
                          onPressed: () => Get.offAllNamed(AppRoutes.SIGNUP),
                          child: Text('Sign Up'.toUpperCase()),
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
