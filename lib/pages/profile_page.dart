import 'package:flutter/material.dart';
import 'bottom_nav.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 48, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/avatar.png'), // replace with your asset
            ),
            const SizedBox(height: 16),
            const Text("User Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text("user@email.com", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.stacked_line_chart),
                  SizedBox(width: 8),
                  Text("Mood Streak: 5 Days"),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
