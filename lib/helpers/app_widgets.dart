import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:teachersfund/helpers/app_utils.dart';

import '../shared/constants.dart';

class UILoadingIndicator extends StatelessWidget {
  const UILoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningCircle(
      color: kLightTertiaryColor,
      size: getWidth(0.08),
      duration: const Duration(milliseconds: 1600),
    );
  }
}

class UIBody extends StatelessWidget {
  final Widget child;
  const UIBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/tf_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themes = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/tf_logo.png',
                width: getWidth(0.4),
                fit: BoxFit.contain,
              ),
            ),
            const UILoadingIndicator(),
            verticalSpace(0.08),
            Text(
              '©Teachers’ Fund of GNAT - 2021.',
              style: themes.textTheme.bodySmall,
            ),
            verticalSpace(0.04),
          ],
        ),
      ),
    );
  }
}
