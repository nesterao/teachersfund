import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:teachersfund/helpers/app_utils.dart';
import 'package:teachersfund/shared/config.dart';

import '../helpers/helper_models.dart';
import '../shared/constants.dart';

Widget logo() {
  return Image.asset(
    'assets/images/tf_logo_circled.png',
    fit: BoxFit.contain,
  );
}

Widget footer() {
  return SizedBox(
    width: double.infinity,
    child: Text(
      '©Teachers’ Fund LBG - 2022.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: getWidth(0.02), backgroundColor: Colors.white),
    ),
  );
}

Widget splashLogo() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        constraints: BoxConstraints.tight(
          Size(getWidth(0.52), getWidth(0.52)),
        ),
        child: Image.asset(
          'assets/images/tf_logo_circled.png',
          fit: BoxFit.contain,
        ),
      ),
      verticalSpace(0.04),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(0.16)),
        child: Text(
          'Teachers’ Fund Mobile'.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getWidth(0.08),
            color: kColorTextPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

AppBar appBar({
  bool showActions = false,
  // bool showBackButton = false,
  bool implyLeading = false,
  List<Widget>? actions,
  String? title,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title?.toUpperCase() ?? '',
      style: TextStyle(
        color: kColorLightTertiary,
        fontSize: getWidth(0.044),
        fontWeight: FontWeight.normal,
      ),
    ),
    centerTitle: true,
    automaticallyImplyLeading: implyLeading,
    actions: showActions
        ? [
            Container(
              margin: EdgeInsets.only(
                right: getWidth(0.04),
                top: getWidth(0.024),
                bottom: getWidth(0.024),
              ),
              child: logo(),
            ),
          ]
        : actions,
  );
}

Widget loadingIndicator() {
  return SpinKitSpinningCircle(
    color: kColorLightTertiary,
    size: getWidth(0.08),
    duration: const Duration(milliseconds: 1600),
  );
}

class PageWithBackground extends StatelessWidget {
  final Widget? body;
  final AppBar? appBar;
  final bool hasFooter;

  const PageWithBackground({
    Key? key,
    this.body,
    this.appBar,
    this.hasFooter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              // image: AssetImage('assets/images/splash_background.png'),
              image: Image.asset('assets/images/splash_background.png').image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          appBar: appBar,
          bottomSheet: hasFooter ? footer() : null,
          body: SafeArea(
            child: body ??
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    splashLogo(),
                    verticalSpace(0.04),
                    loadingIndicator(),
                  ],
                ),
          ),
        ),
      ],
    );
  }
}

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    this.labelText,
    this.onTap,
    // this.enableInteractiveSelection,
    this.enabled,
    this.autoFocus,
    this.obscureText,
    this.focusNode,
    this.expands,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.maxLines,
    this.minLines,
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
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final bool? autoFocus;
  final bool? readOnly;
  final bool? expands;
  // final bool? enableInteractiveSelection;
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
      // enableInteractiveSelection: enableInteractiveSelection ?? true,
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
      expands: expands ?? false,
      textInputAction: textInputAction,
      maxLines: maxLines,
      minLines: minLines,
      // style: themes.textTheme.labelMedium,
      decoration: InputDecoration(
        labelText: labelText,
        // label: Text(labelText ?? ''),
        // hintText: labelText,
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
    this.inputFormatters,
  }) : super(key: key);

  final int? length;
  final bool autoFocus;
  final bool obscureText;
  final bool enablePinAutofill;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function(String e)? onCompleted;
  final String? Function(String? e)? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final ThemeData themes = Theme.of(context);
    return PinCodeTextField(
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
      inputFormatters: inputFormatters ?? [],
      onChanged: (_) {},
      onSubmitted: onCompleted,
      autoDismissKeyboard: false,
      backgroundColor: Colors.transparent,
      pastedTextStyle: themes.textTheme.headlineLarge,
      pinTheme: const PinTheme.defaults(
        activeColor: kColorLightSecondary,
        inactiveColor: kColorLightPrimary,
        selectedColor: kColorLightSecondary,
        borderWidth: 3,
        shape: PinCodeFieldShape.underline,
      ),
      cursorColor: kColorLightPrimary,
      // errorTextMargin: EdgeInsets.fromLTRB(Get.width * 0.25, 0, 0, 0),
      validator: validator,
      useExternalAutoFillGroup: true,
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
        labelText ?? items![0] ?? '',
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

class SettingsListItem extends StatelessWidget {
  const SettingsListItem({
    Key? key,
    required this.text,
    required this.icon,
    this.iconColor,
    this.onTap,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Color? iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData themes = Theme.of(context);

    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Get.width * 0.8),
          bottomRight: Radius.circular(Get.width * 0.8),
        ),
      ),
      leading: Icon(icon, color: iconColor, size: Get.width * 0.064),
      title: Text(text, style: themes.textTheme.labelLarge),
      trailing: const Icon(Icons.keyboard_arrow_right),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 6,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            verticalSpace(0.02),
            const SettingsListItem(
              text: 'Account',
              icon: Icons.manage_accounts_sharp,
              iconColor: kColorLightPrimary,
              // iconColor: Colors.red,
            ),
            verticalSpace(0.02),
            SettingsListItem(
              text: 'Notifications',
              icon: Icons.notifications,
              iconColor: kColorLightPrimary,
              onTap: () {},
            ),
            verticalSpace(0.02),
            SettingsListItem(
              text: 'Settings',
              icon: Icons.settings,
              iconColor: kColorLightPrimary,
              onTap: () {},
            ),
            verticalSpace(0.02),
            SettingsListItem(
              text: 'Logout',
              icon: Icons.logout_outlined,
              iconColor: kErrorColor,
              onTap: () {
                DialogUtil.showDialogBox(
                    title: 'Confirmation',
                    content: const Text('Are you sure you want to log out ?'),
                    noVoidCallBack: () => Get.back(),
                    yesVoidCallBack: () async {
                      await GetStorage().erase();
                      Get.offAllNamed(AppRoutes.LOGIN);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UiButton extends StatelessWidget {
  const UiButton({
    Key? key,
    required this.text,
    this.busy = false,
    this.onPressed,
    this.width,
    this.icon,
  })  : outlined = false,
        super(key: key);

  const UiButton.outlined({
    Key? key,
    required this.text,
    this.busy = false,
    this.onPressed,
    this.width,
    this.icon,
  })  : outlined = true,
        super(key: key);

  final String text;
  final String? icon;
  final bool busy;
  final bool outlined;
  final double? width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        width: width ?? double.infinity,
        height: 52,
        child: outlined
            ? OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white.withOpacity(0.86),
                  ),
                  side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(width: 1.6, color: kErrorColor),
                  ),
                ),
                onPressed: !busy ? onPressed : null,
                child: busy
                    ? SpinKitSpinningCircle(
                        color: kColorLightTertiary,
                        size: getWidth(0.05),
                        duration: const Duration(milliseconds: 1600),
                      )
                    : Text(
                        text.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: kErrorColor),
                      ),
              )
            : ElevatedButton(
                onPressed: !busy ? onPressed : null,
                child: busy
                    ? SpinKitSpinningCircle(
                        color: kColorLightTertiary,
                        size: getWidth(0.05),
                        duration: const Duration(milliseconds: 1600),
                      )
                    : Text(
                        text.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                      ),
              ),
      ),
    );
  }
}

class UiBottomNavBar extends StatelessWidget {
  const UiBottomNavBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.itemCornerRadius = 50,
    this.containerHeight = 80,
    this.animationDuration = const Duration(milliseconds: 200),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  final int? selectedIndex;
  final double iconSize;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final Color? bgColor =
        Theme.of(context).bottomNavigationBarTheme.backgroundColor;

    return SafeArea(
      child: Container(
        width: double.infinity,
        height: containerHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: items.map((BottomNavyBarItem item) {
            final int index = items.indexOf(item);
            return GestureDetector(
              onTap: () => onItemSelected(index),
              child: _ItemWidget(
                item: item,
                iconSize: iconSize,
                isSelected: index == selectedIndex,
                backgroundColor: bgColor,
                itemCornerRadius: itemCornerRadius,
                animationDuration: animationDuration,
                curve: curve,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
  }) : super(key: key);

  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color? backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: isSelected ? Get.width * 0.20 : Get.width * 0.16,
        height: double.maxFinite,
        duration: animationDuration,
        curve: curve,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconTheme(
                data: IconThemeData(
                  size: getWidth(0.062),
                  color: isSelected ? kColorLightSecondary : kColorLightPrimary,
                ),
                child: item.icon,
              ),
              // if (isSelected)
              isSelected
                  ? Container(
                      padding: const EdgeInsets.only(bottom: 3, top: 1),
                      child: DefaultTextStyle.merge(
                        maxLines: 1,
                        child: Text(
                          item.title,
                          style: TextStyle(
                            color: kColorLightSecondary,
                            fontSize: getWidth(0.03),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              isSelected
                  ? Container(
                      width: getWidth(0.01),
                      height: getWidth(0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kAccentColor,
                        border: isSelected
                            ? Border.all(
                                width: 3,
                                color: kAccentColor,
                              )
                            : null,
                      ),
                      alignment: Alignment.bottomCenter,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavyBarItem {
  BottomNavyBarItem({
    required this.icon,
    required this.title,
  });

  final Widget icon;
  final String title;
}

class ServiceList extends StatefulWidget {
  const ServiceList({
    Key? key,
    required this.controller,
    required this.title,
    required this.submenuItems,
  }) : super(key: key);

  final dynamic controller;
  final String title;
  final List<SubMenuItem> submenuItems;

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  @override
  void initState() {
    // TODO: implement initState
    widget.submenuItems.sort((a, b) => a.label.compareTo(b.label));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themes = Theme.of(context);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: getWidth(0.04),
              horizontal: getWidth(0.08),
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(40),
              ),
            ),
            child: Text(
              widget.title,
              style: themes.textTheme.labelLarge,
            ),
          ),
          verticalSpace(0.02),
          Flexible(
            child: ListView.separated(
              addRepaintBoundaries: true,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: getWidth(0.02)),
              itemCount: widget.submenuItems.length,
              itemBuilder: (context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    onTap: () => widget.controller.fetchForm(
                      form: widget.submenuItems[index].label,
                      context: context,
                    ),
                    contentPadding: EdgeInsets.all(getWidth(0.04)),
                    horizontalTitleGap: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getWidth(0.03),
                          ),
                          child: Image.asset(
                            widget.submenuItems[index].image,
                            fit: BoxFit.contain,
                            width: getWidth(0.1),
                          ),
                        ),
                        VerticalDivider(
                          width: getWidth(0.08),
                          thickness: 2,
                          color: kColorLightPrimary,
                        ),
                      ],
                    ),
                    title: Text(
                      widget.submenuItems[index].label,
                      style: themes.textTheme.labelLarge,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: getWidth(0.04)),
            ),
          ),
        ],
      ),
    );
  }
}

Widget stepperTitle(BuildContext context, ThemeData themes, [title]) {
  return Text(
    title ?? '',
    style: themes.textTheme.titleSmall?.copyWith(color: kColorTextSecondary),
  );
}
