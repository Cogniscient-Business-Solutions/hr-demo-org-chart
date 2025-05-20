import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_provider.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: Consumer<LoginProvider>(
        builder: (_, provider, __) {
          return Scaffold(
            appBar: AppBar(title: Text("Login - Provider")),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(controller: userCtrl, decoration: InputDecoration(labelText: 'User ID')),
                  TextField(controller: passCtrl, obscureText: true, decoration: InputDecoration(labelText: 'Password')),
                  SizedBox(height: 20),
                  if (provider.isLoading) CircularProgressIndicator(),
                  if (provider.error != null) Text(provider.error!, style: TextStyle(color: Colors.red)),
                  ElevatedButton(
                    onPressed: provider.isLoading
                        ? null
                        : () async {
                      bool success = await provider.login(userCtrl.text, passCtrl.text);
                      if (success) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                      }
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
