import 'package:flutter/material.dart';
import 'package:serverless_app/pages/auth_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final String title;
  double _width = 0.0;
  double _height = 0.0;
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(title),
              // elevation: 10,
            ),
            // Full width body with padding
            body: Container(
              width: _width,
              height: _height,
              padding: const EdgeInsets.all(10.0),
              // Putting all items in center alignment
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Main logo for page
                    Container(
                      margin: EdgeInsets.only(top: _height * 0.01),
                      child: Image.asset(
                        'assets/images/pocketBase.png',
                        width: _width * 0.5,
                        height: _height * 0.2,
                      ),
                    ),
                    // Heading & Subheading
                    Container(
                      margin: EdgeInsets.only(top: _height * 0.05),
                      child: Text(
                        'Hello',
                        style: TextStyle(
                            color: Colors.grey, fontSize: _width * 0.1),
                      ),
                    ),
                    Container(
                      width: _width * 0.8,
                      margin: EdgeInsets.only(
                          top: _height * 0.02, bottom: _height * 0.05),
                      child: const Text(
                        'Welcome to the Serverless App where you can test modern serverless features',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // Login & Signup Buttons
                    SizedBox(
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
                          _navigateToAuthPage(context, 'Login');
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: _height * 0.01),
                      width: _width * 0.6,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                          padding: EdgeInsets.symmetric(
                              vertical: _height * 0.01,
                              horizontal: _width * 0.1),
                          textStyle: TextStyle(fontSize: _width * 0.05),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(_width * 0.1),
                          ),
                        ),
                        onPressed: () {
                          _navigateToAuthPage(context, 'SignUp');
                        },
                        child: const Text(
                          'SignUp',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
            )));
  }

  void _navigateToAuthPage(BuildContext context, String targetPage) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AuthPage(purpose: targetPage)));
  }
}
