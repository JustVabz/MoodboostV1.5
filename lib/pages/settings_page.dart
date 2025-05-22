import 'package:flutter/material.dart';
import 'bottom_nav.dart';
import 'package:app1/config/theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)
      ?.settings
      .arguments as String? ?? 'User';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 48, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/cat.jpg'), 
            ),
            const SizedBox(height: 16),
            Text(username, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.stacked_line_chart),
                  SizedBox(width: 8),
                  Text("Mood Streak: 5 Days", style: TextStyle(color: secTextColor),),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: _buildInfoBox("Reflections", "12")),
                const SizedBox(width: 12),
                Expanded(child: _buildInfoBox("Music Played", "8")),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildInfoBox("Sessions", "6")),
                const SizedBox(width: 12),
                Expanded(child: _buildInfoBox("Badges", "3")),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Log Out"),
                    content: const Text("Are you sure you want to log out?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/login',
                            (route) => false,
                          );
                        },
                        child: const Text("Log Out"),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: secondary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }

  Widget _buildInfoBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 80,
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: secTextColor)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
