import 'package:flutter/material.dart';

import '../utils/log.dart';

// ignore: must_be_immutable
class AuthPage extends StatelessWidget {
  final String purpose;
  double _width = 0;
  double _height = 0;
  String firstName = '';
  final _formkey = GlobalKey<FormState>();

  AuthPage({super.key, required this.purpose});

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(purpose),
        ),
        body: Container(
          width: _width,
          height: _height,
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'FirstName'
                  ),
                  onChanged: (String value) {
                    firstName = value;
                  },
                  validator: (value) {
                    if(value == null || value.isEmpty) return 'Please enter some text';
                    return null;
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: _height * 0.04),
                  child: SizedBox(
                      width: _width * 0.6,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black87,
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: _height * 0.01,
                              horizontal: _width * 0.1),
                          textStyle: TextStyle(fontSize: _width * 0.05),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(_width * 0.1),
                          ),
                        ),
                        onPressed: () {
                          if(_formkey.currentState!.validate()){
                            logger.d('Hello');
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
