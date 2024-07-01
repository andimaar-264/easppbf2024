import 'package:flutter/material.dart';

class RewardsScreen extends StatelessWidget {
  static const routeName = '/rewards';

  final List<Map<String, dynamic>> rewards = [
    {'name': 'Reward 1', 'cost': 50},
    {'name': 'Reward 2', 'cost': 100},
    {'name': 'Reward 3', 'cost': 200},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards'),
        backgroundColor: Color(0xFF02A963),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: rewards.length,
        itemBuilder: (ctx, i) {
          return Card(
            child: ListTile(
              title: Text(rewards[i]['name']),
              trailing: Text('${rewards[i]['cost']} stars'),
              onTap: () {
                // Implement redeem functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Redeemed ${rewards[i]['name']}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
