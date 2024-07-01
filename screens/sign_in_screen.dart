import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'sign_up_screen.dart'; // Add this import

class SignInScreen extends StatelessWidget {
  static const routeName = '/sign-in';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Color(0xFF02A963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF02A963), // Button color
              ),
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.white), // Text color
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SignUpScreen.routeName);
              },
              child: Text(
                'Don\'t have an account? Sign Up',
                style: TextStyle(color: Color(0xFF02A963)), // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
