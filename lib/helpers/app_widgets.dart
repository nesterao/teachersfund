import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
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

AppBar appBar({
  bool showActions = false,
  bool showBackButton = false,
  VoidCallback? backOnTap,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    automaticallyImplyLeading: false,
    leading: showBackButton
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          )
        : null,
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
  const LoadingScreen({Key? key}) : super(key: key);

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
              style: themes.textTheme.bodySmall?.copyWith(
                color: kColorLightTertiary,
              ),
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

    return RepaintBoundary(
      child: TextFormField(
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
      ),
    );
  }
}

class PinInput extends StatelessWidget {
  const PinInput({
    Key? key,
    this.length,
    this.autoFocus = false,
    this.obscureText = false,
    this.enablePinAutofill = false,
    this.focusNode,
    this.controller,
    this.onCompleted,
    this.validator,
  }) : super(key: key);

  final int? length;
  final bool autoFocus;
  final bool obscureText;
  final bool enablePinAutofill;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function(String e)? onCompleted;
  final String? Function(String? e)? validator;

  @override
  Widget build(BuildContext context) {
    final ThemeData themes = Theme.of(context);
    return RepaintBoundary(
      child: PinCodeTextField(
        appContext: context,
        length: length!,
        autoFocus: autoFocus,
        focusNode: focusNode,
        controller: controller,
        obscureText: obscureText,
        animationType: AnimationType.scale,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        keyboardType: TextInputType.number,
        hapticFeedbackTypes: HapticFeedbackTypes.medium,
        textInputAction: TextInputAction.send,
        onCompleted: onCompleted,
        onChanged: (_) {},
        onSubmitted: onCompleted,
        backgroundColor: Colors.transparent,
        pastedTextStyle: themes.textTheme.headlineLarge,
        pinTheme: const PinTheme.defaults(
          activeColor: kColorLightSecondary,
          inactiveColor: kAccentColor,
          selectedColor: kColorLightPrimary,
          borderWidth: 4,
        ),
        errorTextMargin: EdgeInsets.fromLTRB(Get.width * 0.25, 0, 0, 0),
        validator: validator,
        useExternalAutoFillGroup: true,
      ),
    );
  }
}

class DropdownField extends StatelessWidget {
  const DropdownField({
    Key? key,
    this.enabled,
    this.autoFocus,
    this.focusNode,
    this.validator,
    this.onTap,
    this.onChanged,
    this.items,
    this.labelText,
  }) : super(key: key);

  final bool? enabled;
  final bool? autoFocus;
  final FocusNode? focusNode;
  final String? Function(String? e)? validator;
  final VoidCallback? onTap;
  final Function(String? e)? onChanged;
  final List<String?>? items;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      enableFeedback: enabled ?? true,
      autofocus: autoFocus ?? false,
      focusNode: focusNode,
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      iconEnabledColor: kAccentColor,
      iconSize: Get.width * 0.06,
      elevation: 0,
      isExpanded: true,
      hint: Text(
        items![0] ?? labelText ?? '',
        style: const TextStyle(color: Colors.grey),
      ),
      items: items!.map<DropdownMenuItem<String>>((String? value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text('$value'),
        );
      }).toList(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 6,
      child: Column(children: [
        const SizedBox(height: 100),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          leading: const Icon(Icons.home),
          title: const Text(
            'Home',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/settings-screen');
          },
          leading: const Icon(Icons.settings),
          title: const Text(
            'Settings',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/contact-screen');
          },
          leading: const Icon(Icons.contact_mail),
          title: const Text(
            'Contact',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ]),
    );
  }
}
