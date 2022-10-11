import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachersfund/helpers/app_utils.dart';
import 'package:teachersfund/helpers/app_widgets.dart';
import 'package:teachersfund/shared/config.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
                              'Sign Up Form,',
                              style: themes.textTheme.headlineLarge,
                            ),
                            Text(
                              'Fill out the form below accurately.',
                              style: themes.textTheme.headlineMedium,
                            ),
                            verticalSpace(0.04),
                            TextInputField(
                              labelText: 'National ID No.',
                              onTap: () {},
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                            ),
                            verticalSpace(0.02),
                            TextInputField(
                              labelText: 'Surname',
                              onTap: () {},
                              keyboardType: TextInputType.name,
                            ),
                            verticalSpace(0.02),
                            TextInputField(
                              labelText: 'Other Names',
                              onTap: () {},
                              keyboardType: TextInputType.name,
                            ),
                            verticalSpace(0.02),
                            // TextInputField(
                            //   labelText: 'Date of Birth',
                            //   onTap: () {},
                            // ),
                            TextInputField(
                              // focusNode: controller.dateOfBirthFN,
                              labelText: 'Date of Birth',
                              // controller: controller.dateOfBirthTEC,
                              keyboardType: TextInputType.datetime,
                              maxLength: 10,
                              textInputAction: TextInputAction.send,
                              onTap: () => showDatePicker(
                                context: context,
                                initialDate: DateTime(DateTime.now().year - 18),
                                firstDate: DateTime(1890),
                                lastDate: DateTime(DateTime.now().year - 17),
                              ).then((DateTime? value) {
                                if (value != null) {
                                  final String date =
                                      '${value.toLocal()}'.split(' ')[0];
                                  // controller.dateOfBirthTEC!.text =
                                  //     value.toIso8601String();
                                  // controller.dateOfBirthTEC!.text = date;
                                }
                              }),
                              enableInteractiveSelection: false,
                              readOnly: true,
                              // validator: Validators.dateOfBirthValidator,
                              onEditingComplete: () {
                                // fieldFocusChange(
                                //   context,
                                //   controller.surnameFN,
                                //   controller.dateOfBirthFN,
                                // );
                              },
                            ),
                            verticalSpace(0.02),
                            TextInputField(
                              labelText: 'Ghana Post GPS',
                              onTap: () {},
                            ),
                            verticalSpace(0.04),
                            ElevatedButton(
                              onPressed: () => Get.toNamed(AppRoutes.SETUPPIN),
                              child: Text('Next'.toUpperCase()),
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
