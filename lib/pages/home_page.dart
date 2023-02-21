import 'package:flutter/material.dart';
import 'package:teachersfund/widgets/app_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWithBackground(
      appBar: appBar(title: 'Home Page'),
      body: const Center(
        child: Placeholder(
          child: Text('HomePage'),
        ),
      ),
    );
  }
}
