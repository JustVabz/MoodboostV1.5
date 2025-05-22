import 'package:app1/config/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("MoodBoost",
                    style: TextStyle(color: priTextColor) ),
                const SizedBox(height: 40),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username / Email',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final username = usernameController.text.trim();
                      if (username.isNotEmpty) {
                  Navigator.pushReplacementNamed(
                    context,
                    '/home',
                    arguments: username,                   // ← send username
                  );
                }
                    },
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text("Don't have an account? Sign up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
