import 'package:flutter/material.dart';
import 'package:serverless_app/pages/dashboard_page.dart';
import 'package:string_validator/string_validator.dart';

import '../utils/log.dart';

// ignore: must_be_immutable
class AuthPage extends StatelessWidget {
  final String purpose;
  double _width = 0;
  double _height = 0;

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
        // Body with fullscreen width and height and padding
        body: SingleChildScrollView(
          child: Container(
            width: _width,
            height: _height,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Makes Login Form Center
                purpose == 'Login'
                    ? SizedBox(
                        height: _height * 0.2,
                      )
                    : Container(),
                // Getting dynamic heading
                Container(
                  margin: EdgeInsets.symmetric(vertical: _height * 0.035),
                  child: Text(
                    _getFormHeading(),
                    style: TextStyle(fontSize: _width * 0.05),
                  ),
                ),
                // Child widget for Authentication Forms
                AuthForm(width: _width, height: _height, purpose: purpose),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getFormHeading() {
    return purpose == 'Login'
        ? 'Enter your account details to login.'
        : 'Enter your details to join the platform.';
  }
}

// ignore: must_be_immutable
class AuthForm extends StatelessWidget {
  final double width;
  final double height;
  final String purpose;

  final _formKey = GlobalKey<FormState>();
  //Temp User fields
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String gender = 'Male';
  List<String> genders = ['Male', 'Female'];

  AuthForm({super.key, required this.width, required this.height, required this.purpose});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //First Name -> SignUp
          purpose == 'SignUp'
              ? Container(
            margin: EdgeInsets.only(bottom: height * 0.01),
            child: TextFormField(
              obscureText: false,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'First Name'),
              onChanged: (String value) {
                firstName = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!value.isLength(3)) {
                  return 'First name should be of at least 3 characters';
                }
                return null;
              },
            ),
          )
              : Container(),
          //Last Name -> SignUp
          purpose == 'SignUp'
              ? Container(
            margin: EdgeInsets.only(bottom: height * 0.01),
            child: TextFormField(
              obscureText: false,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Last Name'),
              onChanged: (String value) {
                lastName = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!value.isLength(3)) {
                  return 'Last name should be of at least 3 characters';
                }
                return null;
              },
            ),
          )
              : Container(),
          //Email -> SignUp/Login
          Container(
            margin: EdgeInsets.only(bottom: height * 0.01),
            child: TextFormField(
              obscureText: false,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
              onChanged: (String value) {
                email = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!value.isEmail) {
                  return 'Please enter valid email';
                }
                return null;
              },
            ),
          ),
          purpose == 'SignUp'
              ? Container(
            margin: EdgeInsets.only(bottom: height * 0.01),
            child: DropdownButtonFormField(
              value: gender,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Gender'),
              icon: const Icon(Icons.keyboard_arrow_down),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: (String? value) {
                if (value != null) gender = value;
              },
              items:
              genders.map<DropdownMenuItem<String>>((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
            ),
          )
              : Container(),
          //Password -> SignUp/Login
          Container(
            margin: EdgeInsets.only(bottom: height * 0.01),
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
              onChanged: (String value) {
                password = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!value.isLength(8)) {
                  return 'Password should be of at least 8 characters';
                }
                return null;
              },
            ),
          ),
          //Confirm Password -> SignUp/Login
          purpose == 'SignUp'
              ? Container(
            margin: EdgeInsets.only(bottom: height * 0.01),
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password'),
              onChanged: (String value) {
                confirmPassword = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!value.isLength(8)) {
                  return 'Confirm password should be of at least 8 characters';
                }
                if (value != password) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
          )
              : Container(),

          // Submit Button
          Container(
            margin: EdgeInsets.only(top: height * 0.01),
            child: SizedBox(
              width: width * 0.6,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.1),
                  textStyle: TextStyle(fontSize: width * 0.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * 0.1),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (purpose == 'Login') {
                      logger.d('Login details: $email $password');
                    }
                    if (purpose == 'SignUp') {
                      logger.d(
                          'SignUp details: $firstName $lastName $email $gender $password $confirmPassword');
                    }

                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardPage()));
                  }
                },
                child: Text(
                  purpose,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

