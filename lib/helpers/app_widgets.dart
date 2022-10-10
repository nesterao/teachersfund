import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:teachersfund/helpers/app_utils.dart';

import '../shared/constants.dart';

Widget logo() {
  return Container(
    constraints: BoxConstraints.loose(
      Size(getWidth(0.16), getWidth(0.16)),
    ),
    child: Image.asset(
      'assets/images/tf_logo.png',
      fit: BoxFit.contain,
    ),
  );
}

class UILoadingIndicator extends StatelessWidget {
  const UILoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SpinKitSpinningCircle(
        color: kColorLightTertiary,
        size: getWidth(0.048),
        duration: const Duration(milliseconds: 1600),
      ),
    );
  }
}

class UIBody extends StatelessWidget {
  final Widget child;
  const UIBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/tf_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          // child: ,
        ),
        RepaintBoundary(child: child),
      ],
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

    return UIBody(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                constraints: BoxConstraints.loose(
                  Size(getWidth(0.24), getWidth(0.24)),
                ),
                child: logo(),
              ),
            ),
            const UILoadingIndicator(),
            verticalSpace(0.04),
            Text(
              '©Teachers’ Fund of GNAT - 2022.',
              style: themes.textTheme.bodySmall,
            ),
            verticalSpace(0.04),
          ],
        ),
      ),
    );
  }
}

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    this.labelText,
    @required this.onTap,
    this.enableInteractiveSelection,
    this.enabled,
    this.autoFocus,
    this.obscureText,
    this.focusNode,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.textAlign,
    this.onEditingComplete,
    this.readOnly,
    this.validator,
    this.textInputAction,
    this.inputFormatter,
    this.textCapitalization,
  }) : super(key: key);

  final String? labelText;
  final TextEditingController? controller;
  final bool? obscureText;
  final int? maxLength;
  final bool? enabled;
  final bool? autoFocus;
  final bool? readOnly;
  final bool? enableInteractiveSelection;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatter;
  final String? Function(String? e)? validator;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    final ThemeData themes = Theme.of(context);

    return TextFormField(
      enabled: enabled ?? true,
      enableInteractiveSelection: enableInteractiveSelection ?? true,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      textAlign: textAlign ?? TextAlign.start,
      readOnly: readOnly ?? false,
      autofocus: autoFocus ?? false,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      maxLength: maxLength,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onEditingComplete: onEditingComplete,
      inputFormatters: inputFormatter,
      onTap: onTap,
      textInputAction: textInputAction,
      style: themes.textTheme.labelMedium,
      decoration: InputDecoration(
        label: Text(labelText ?? 'Staff ID'),
      ),
    );
  }
}
