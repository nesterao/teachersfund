import 'package:flutter/material.dart';
import 'package:teachersfund/helpers/app_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themes = Theme.of(context);

    return Scaffold(
      drawer: const MyDrawer(),
      body: Center(
        child: Text(
          'Home Page',
          style: themes.textTheme.headlineLarge,
        ),
      ),
    );
  }
}
