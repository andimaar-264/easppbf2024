import 'package:flutter/material.dart';
import 'rewards_screen.dart';

class StarsScreen extends StatelessWidget {
  static const routeName = '/stars';

  final int stars = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Stars'),
        backgroundColor: Color(0xFF02A963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have $stars stars!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RewardsScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF02A963),
              ),
              child: Text(
                'Redeem Rewards',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
