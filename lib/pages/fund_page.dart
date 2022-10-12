import 'package:flutter/material.dart';

class FundPage extends StatelessWidget {
  const FundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themes = Theme.of(context);

    return Center(
      child: Text(
        'Fund Page',
        style: themes.textTheme.headlineLarge,
      ),
    );
  }
}
