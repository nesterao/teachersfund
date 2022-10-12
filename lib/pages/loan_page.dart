import 'package:flutter/material.dart';

class LoanPage extends StatelessWidget {
  const LoanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themes = Theme.of(context);

    return Center(
      child: Text(
        'Loan Page',
        style: themes.textTheme.headlineLarge,
      ),
    );
  }
}
