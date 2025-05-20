import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';
import 'org_chart_screen.dart'; // <-- Import OrgChartScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await AuthService.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to OrgChartScreen on button tap
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrgChartScreen()),
            );
          },
          child: Text('View Org Chart'),
        ),
      ),
    );
  }
}
