import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DashboardPage extends StatelessWidget {
  double _width = 0;
  double _height = 0;
  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: _width,
          height: _height,
          padding: const EdgeInsets.all(10),
          child: const Center(
            child: Text('Home Page'),
          ),
        ),
      ),
    ));
  }
}
