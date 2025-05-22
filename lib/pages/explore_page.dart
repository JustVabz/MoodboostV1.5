import 'package:app1/pages/bottom_nav.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 48, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Find what\nyou’re looking\nfor!",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    )),
            const SizedBox(height: 32),
            _buildExploreButton(context, "CheerBot Therapy Session", '/chatbot'),
            const SizedBox(height: 16),
            _buildExploreButton(context, "Weekly Music Recommendation", '/music'),
            const SizedBox(height: 16),
            _buildExploreButton(context, "Daily Reflections", '/reflections'),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildExploreButton(BuildContext context, String title, String route) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, route),
        child: Text(title),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
