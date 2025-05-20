import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/auth_service.dart';

class LoginProvider with ChangeNotifier {
  bool isLoading = false;
  String? error;
  String? userName;

  Future<bool> login(String userId, String password) async {
    isLoading = true;
    notifyListeners();

    final response = await http.post(
      Uri.parse('http://103.209.135.64/api/Login'),
      headers: {
        'Content-Type': 'application/json',
        'accept': '*/*',
      },
      body: jsonEncode({'userId': userId, 'password': password}),
    );

    final json = jsonDecode(response.body);
    if (json['status'] == 'SUCCESS') {
      await AuthService.saveToken(json['data']['authToken']);
      userName = json['data']['userName'];
      isLoading = false;
      notifyListeners();
      return true;
    } else {
      error = 'Invalid credentials';
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
