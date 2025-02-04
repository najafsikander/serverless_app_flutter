import 'package:flutter/material.dart';
import 'package:serverless_app/pages/dashboard_pages/chat_page.dart';
import 'package:serverless_app/pages/dashboard_pages/main_page.dart';
import 'package:serverless_app/pages/dashboard_pages/profile_page.dart';
import 'package:serverless_app/pages/dashboard_pages/settings_page.dart';
import '../utils/log.dart';

// ignore: must_be_immutable
class DashboardPage extends StatefulWidget {

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  double _width = 0;

  double _height = 0;

  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body:  <Widget>[
        MainPage(),
        ChatPage(),
        ProfilePage(),
        SettingsPage()
      ][_activeIndex],
      bottomNavigationBar: NavigationBar(destinations: _getBottomNavigationDestinations(),
      selectedIndex: _activeIndex,
      indicatorColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            _activeIndex = index;
          });
          logger.d('Active index: $index $_activeIndex');
        },
      ),
    ),);
  }


  List<NavigationDestination> _getBottomNavigationDestinations() {
    List<NavigationDestination> items = [
      const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
      const NavigationDestination(icon: Icon(Icons.chat), label: 'Chat'),
      const NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
      const NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
    ];
    return items;
  }
}


