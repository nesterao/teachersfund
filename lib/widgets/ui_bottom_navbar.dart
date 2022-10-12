import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachersfund/shared/constants.dart';

class UiBottomNavBar extends StatelessWidget {
  const UiBottomNavBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
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
    final Color bgColor = Theme.of(context).bottomAppBarColor;

    return Container(
      decoration: BoxDecoration(color: bgColor),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeight,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
  }) : super(key: key);

  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: isSelected ? Get.width * 0.3 : Get.width * 0.16,
        height: double.maxFinite,
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
          // color: isSelected ? backgroundColor : backgroundColor,
          // borderRadius: BorderRadius.circular(itemCornerRadius),
          border:
              isSelected ? const Border(bottom: BorderSide(width: 4)) : null,
        ),
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
                  size: Get.width * 0.056,
                  color: isSelected ? kAccentColor : kColorLightPrimary,
                ),
                child: item.icon,
              ),
              // if (isSelected)
              Container(
                padding: const EdgeInsets.only(left: 4),
                child: DefaultTextStyle.merge(
                  // style: GoogleFonts.robotoCondensed(
                  //   color: kAccentColor,
                  //   fontWeight: FontWeight.bold,
                  //   fontSize: Get.width * 0.04,
                  // ),
                  maxLines: 1,
                  child: item.title,
                ),
              ),
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
  final Widget title;
}
