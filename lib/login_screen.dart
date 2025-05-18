import 'package:app1/config/theme.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart'; // Replace with your actual file name

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    String username = _usernameController.text.trim();

    // Navigate to home screen with username
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(username: username, dailyAffirmation: "It does not matter how slowly you go as long as you do not stop."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary, // Assuming you have a light background
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MoodBoost',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: priTextColor,
                  fontSize: 60,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 80),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Username / Email',
                filled: true,
                fillColor: secondary,
                hintStyle: TextStyle(color: sectextColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(color: Colors.blue, width: 2),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              ),
              style: TextStyle(color: sectextColor),
            ),
            const SizedBox(height: 35),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: secondary,
                hintStyle: TextStyle(color: sectextColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(color: Colors.blue, width: 2),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              ),
              style: TextStyle(color: sectextColor),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _handleLogin,
                  child: Container(
                    width: 100,
                    height: 50,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: secondary,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Text(
                      'Log-in',
                      style: TextStyle(
                        color: sectextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
