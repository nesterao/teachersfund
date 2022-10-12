import 'package:flutter/material.dart';
import 'package:teachersfund/helpers/app_widgets.dart';
import 'package:teachersfund/pages/fund_page.dart';
import 'package:teachersfund/pages/help_page.dart';

import 'home_page.dart';
import 'loan_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedScreenIndex = 0;

  final List<Widget> pages = <Widget>[
    const HomePage(),
    const FundPage(),
    const LoanPage(),
    const HelpPage(),
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UIBody(
      child: Scaffold(
        appBar: appBar(showActions: true),
        drawer: const MyDrawer(),
        body: pages[_selectedScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedScreenIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _selectScreen,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: 'Fund',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.money),
              label: 'Loans',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline),
              label: 'Help',
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildBottomBar() {
  //   return UiBottomNavBar(
  //     containerHeight: 66,
  //     selectedIndex: 0,
  //     itemCornerRadius: 8,
  //     curve: Curves.easeIn,
  //     iconSize: Get.width * 0.06,
  //     onItemSelected: (_) {},
  //     items: <BottomNavyBarItem>[
  //       BottomNavyBarItem(
  //         icon: const Icon(Icons.home_filled),
  //         title: const Text('Home'),
  //       ),
  //       BottomNavyBarItem(
  //         icon: const Icon(Icons.grid_view),
  //         title: const Text('Fund'),
  //       ),
  //       BottomNavyBarItem(
  //         icon: const Icon(Icons.account_circle_sharp),
  //         title: const Text('Loans'),
  //       ),
  //       BottomNavyBarItem(
  //         icon: const Icon(Icons.bar_chart_rounded),
  //         title: const Text('Help'),
  //       ),
  //     ],
  //   );
  // }
}
