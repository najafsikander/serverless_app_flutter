import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  double _width = 0;
  double _height = 0;

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return Padding(padding: const EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 0),child: SizedBox(
      width: _width,
      height: _height,
      child: const Text('Profile page'),
    ),);
  }
}
