import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State
  {
  // Controllers for text fields
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();

  // Focus nodes for text fields
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _retypePasswordFocusNode = FocusNode();

  @override
  void dispose() {
    // Clean up focus nodes when the widget is disposed
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _retypePasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_circle), // Placeholder for logo icon
        title: Text('Shrine'), // Placeholder for app title
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 80.0),
              Column(
                children: <Widget>[
                  Image.asset('assets/diamond.png'),
                  SizedBox(height: 16.0),
                  Text('SHRINE'),
                ],
              ),
              SizedBox(height: 120.0),
              // Username TextField
              TextField(
                controller: _usernameController,
                focusNode: _usernameFocusNode,
                decoration: _textFieldDecoration('Username'),
              ),
              SizedBox(height: 12.0),
              // Password TextField
              TextField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                decoration: _textFieldDecoration('Password'),
                obscureText: true,
              ),
              SizedBox(height: 12.0),
              // Retype Password TextField
              TextField(
                controller: _retypePasswordController,
                focusNode: _retypePasswordFocusNode,
                decoration: _textFieldDecoration('Retype Password'),
                obscureText: true,
              ),
              SizedBox(height: 24.0),
              // Button bar
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Cancel Button
                  TextButton(
                    onPressed: () {
                      _clearTextFields();
                    },
                    child: Text('CANCEL'),
                  ),
                  // Register Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Home page
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text('REGISTER'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to clear text fields
  void _clearTextFields() {
    _usernameController.clear();
    _passwordController.clear();
    _retypePasswordController.clear();
  }

  // Function to generate InputDecoration for text fields
  InputDecoration _textFieldDecoration(String labelText) {
    return InputDecoration(
      filled: true,
      labelText: labelText,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(width: 1.0, color: Colors.blue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(width: 1.0, color: Colors.blue),
      ),
    );
  }
}

