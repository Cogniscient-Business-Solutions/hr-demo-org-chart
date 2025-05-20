import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // <-- ADD this
import 'package:shared_preferences/shared_preferences.dart';

import 'login_provider_app/home_screen.dart';
import 'login_provider_app/login_screen.dart';
import 'login_provider_app/org_chart_provider.dart'; // <-- ADD this

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('authToken');
  runApp(MyApp(isLoggedIn: token != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({required this.isLoggedIn, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrgChartProvider()), // <-- Provide OrgChartProvider here
      ],
      child: MaterialApp(
        title: 'Login App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: isLoggedIn ? HomeScreen() : LoginScreen(),
      ),
    );
  }
}
