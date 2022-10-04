import 'package:flutter/material.dart';
import 'package:teachersfund/helpers/app_utils.dart';
import 'package:teachersfund/helpers/app_widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UIBody(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Card(
              child: Container(
                width: getWidth(0.8),
                height: getHeight(0.6),
                padding: EdgeInsets.symmetric(
                  horizontal: getWidth(0.08),
                  vertical: getHeight(0.04),
                ),
                child: const Text('Card'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
