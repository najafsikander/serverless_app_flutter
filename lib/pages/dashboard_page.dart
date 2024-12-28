import 'package:flutter/material.dart';
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
        Container(
          width: _width,
          height: _height,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child:  Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  color: Colors.redAccent,
                  width: _width,
                  height: _height * 0.3,
                  child: Text(_activeIndex.toString()),
                ),
                Container(
                  color: Colors.blueAccent,
                  width: _width,
                  height: _height * 0.5,
                  child: const Text('Hello'),
                ),
                Container(
                  color: Colors.greenAccent,
                  width: _width,
                  height: _height * 0.6,
                  child: const Text('Hello'),
                ),
                Container(
                  color: Colors.pinkAccent,
                  width: _width,
                  height: _height * 0.7,
                  child: const Text('Hello'),
                ),
                Container(
                  color: Colors.purpleAccent,
                  width: _width,
                  height: _height * 0.2,
                  child: const Text('Hello'),
                )
              ],
            ),
          ),
        ),
        Container(
          width: _width,
          height: _height,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child:  Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  color: Colors.redAccent,
                  width: _width,
                  height: _height * 0.3,
                  child: Text(_activeIndex.toString()),
                ),
                Container(
                  color: Colors.blueAccent,
                  width: _width,
                  height: _height * 0.5,
                  child: const Text('Hello 2'),
                ),
                Container(
                  color: Colors.greenAccent,
                  width: _width,
                  height: _height * 0.6,
                  child: const Text('Hello'),
                ),
                Container(
                  color: Colors.pinkAccent,
                  width: _width,
                  height: _height * 0.7,
                  child: const Text('Hello'),
                ),
                Container(
                  color: Colors.purpleAccent,
                  width: _width,
                  height: _height * 0.2,
                  child: const Text('Hello'),
                )
              ],
            ),
          ),
        )
      ][_activeIndex],
      bottomNavigationBar: NavigationBar(destinations: _getBottomNavigationDestinations(),
      selectedIndex: _activeIndex,
      indicatorColor: Colors.white,
        onDestinationSelected: (int index) {
          _activeIndex = index;
          logger.d('Active index: $index $_activeIndex');
          setState(() {

          });
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


