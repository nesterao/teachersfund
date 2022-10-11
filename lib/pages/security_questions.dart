import 'package:flutter/material.dart';
import 'package:teachersfund/helpers/app_utils.dart';
import 'package:teachersfund/helpers/app_widgets.dart';

class SecurityQuestions extends StatelessWidget {
  const SecurityQuestions({Key? key}) : super(key: key);

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
                              'Security Questions,',
                              style: themes.textTheme.headlineLarge,
                            ),
                            Text(
                              'Answers are required to reset your PIN.',
                              style: themes.textTheme.headlineMedium,
                            ),
                            verticalSpace(0.04),
                            TextInputField(
                              labelText: 'Security Question 1',
                              onTap: () {},
                              enabled: false,
                              enableInteractiveSelection: false,
                            ),
                            verticalSpace(0.02),
                            TextInputField(
                              labelText: 'Answer 1',
                              onTap: () {},
                              keyboardType: TextInputType.name,
                            ),
                            verticalSpace(0.02),
                            TextInputField(
                              labelText: 'Security Question 2',
                              onTap: () {},
                              enabled: false,
                              enableInteractiveSelection: false,
                            ),
                            verticalSpace(0.02),
                            TextInputField(
                              labelText: 'Answer 2',
                              onTap: () {},
                            ),
                            verticalSpace(0.04),
                            ElevatedButton(
                              onPressed: () {},
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
