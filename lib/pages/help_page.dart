import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themes = Theme.of(context);

    return Center(
      child: Text(
        'Help Page',
        style: themes.textTheme.headlineLarge,
      ),
    );
  }
}
