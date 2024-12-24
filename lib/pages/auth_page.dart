import 'package:flutter/material.dart';

import '../utils/log.dart';

// ignore: must_be_immutable
class AuthPage extends StatelessWidget {
  final String purpose;
  double _width = 0;
  double _height = 0;

  //Temp User fields
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String gender = '';
  String birthday = '';

  final _formKey = GlobalKey<FormState>();

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
        body: SingleChildScrollView(
          child: Container(
            width: _width,
            height: _height,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: _height * 0.035),
                    child: Text(_getFormHeading(),
                    style: TextStyle(
                      fontSize: _width * 0.05
                    ),),),
                Form(
                  key: _formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      purpose == 'SignUp'? Container(
                        margin: EdgeInsets.only(bottom: _height * 0.01),
                        child: TextFormField(
                          obscureText: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'First Name'
                          ),
                          onChanged: (String value) {
                            firstName = value;
                          },
                          validator: (value) {
                            if(value == null || value.isEmpty) return 'Please enter some text';
                            return null;
                          },
                        ),
                      ):Container(),
                      purpose == 'SignUp'? Container(
                        margin: EdgeInsets.only(bottom: _height * 0.01),
                        child: TextFormField(
                          obscureText: false,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Last Name'
                          ),
                          onChanged: (String value) {
                            lastName = value;
                          },
                          validator: (value) {
                            if(value == null || value.isEmpty) return 'Please enter some text';
                            return null;
                          },
                        ),
                      ):Container(),
                      Container(
                        margin: EdgeInsets.only(bottom: _height * 0.01),
                        child: TextFormField(
                          obscureText: false,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email'
                          ),
                          onChanged: (String value) {
                            email = value;
                          },
                          validator: (value) {
                            if(value == null || value.isEmpty) return 'Please enter some text';
                            return null;
                          },
                        ),
                      ),
                      purpose == 'SignUp'?Container(
                        margin: EdgeInsets.only(bottom: _height * 0.01),
                        child: TextFormField(
                          obscureText: false,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Gender'
                          ),
                          onChanged: (String value) {
                            gender = value;
                          },
                          validator: (value) {
                            if(value == null || value.isEmpty) return 'Please enter some text';
                            return null;
                          },
                        ),
                      ):Container(),
                      purpose == 'SignUp'?Container(
                        margin: EdgeInsets.only(bottom: _height * 0.01),
                        child: TextFormField(
                          obscureText: false,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Birthday'
                          ),
                          onChanged: (String value) {
                            birthday = value;
                          },
                          validator: (value) {
                            if(value == null || value.isEmpty) return 'Please enter some text';
                            return null;
                          },
                        ),
                      ):Container(),
                      Container(
                        margin: EdgeInsets.only(bottom: _height * 0.01),
                        child: TextFormField(
                          obscureText: false,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password'
                          ),
                          onChanged: (String value) {
                            password = value;
                          },
                          validator: (value) {
                            if(value == null || value.isEmpty) return 'Please enter some text';
                            return null;
                          },
                        ),
                      ),
                      purpose == 'SignUp'?Container(
                        margin: EdgeInsets.only(bottom: _height * 0.01),
                        child: TextFormField(
                          obscureText: false,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password'
                          ),
                          onChanged: (String value) {
                            confirmPassword = value;
                          },
                          validator: (value) {
                            if(value == null || value.isEmpty) return 'Please enter some text';
                            if(value != password) return 'Passwords do not match';
                            return null;
                          },
                        ),
                      ):Container(),
                      Container(
                        margin: EdgeInsets.only(top: _height * 0.01),
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
                                if(_formKey.currentState!.validate()){
                                  logger.d('Hello');
                                }
                              },
                              child:  Text(
                                purpose,
                                style: const TextStyle(color: Colors.black87),
                              ),
                            ),
                          ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getFormHeading() {
    return purpose == 'Login' ? 'Enter your account details to login.' : 'Enter your details to join the platform.';
  }
}


