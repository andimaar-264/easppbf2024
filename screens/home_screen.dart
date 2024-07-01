import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int stars = 100;
  List<Map<String, dynamic>> rewards = [
    {'name': 'Reward 1', 'cost': 50},
    {'name': 'Reward 2', 'cost': 100},
    {'name': 'Reward 3', 'cost': 200},
  ];
  List<String> redeemedRewards = [];

  void redeemReward(String rewardName, int cost) {
    if (stars >= cost) {
      setState(() {
        stars -= cost;
        redeemedRewards.add(rewardName);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Redeemed $rewardName')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Not enough stars to redeem $rewardName')),
      );
    }
  }

  void addStars(int amount) {
    setState(() {
      stars += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xFF02A963),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Starbucks dengan ukuran 50%
                Image.asset(
                  'assets/images/starbucks_logo.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                SizedBox(height: 20),
                Text(
                  'You have $stars stars!',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => addStars(10),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF02A963), // Button color
                  ),
                  child: Text(
                    'Add 10 Stars',
                    style: TextStyle(color: Colors.white), // Text color
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Redeemed Rewards:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: redeemedRewards.length,
                    itemBuilder: (ctx, i) {
                      return ListTile(
                        title: Text(redeemedRewards[i]),
                        trailing: Icon(Icons.done),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Available Rewards',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: rewards.length,
                    itemBuilder: (ctx, i) {
                      return Card(
                        child: ListTile(
                          title: Text(rewards[i]['name']),
                          trailing: Text('${rewards[i]['cost']} stars'),
                          onTap: () {
                            redeemReward(rewards[i]['name'], rewards[i]['cost']);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
