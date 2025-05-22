import 'package:app1/config/theme.dart';
import 'package:flutter/material.dart';
import 'bottom_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)
      ?.settings
      .arguments as String? ?? 'User';
    final date = DateTime.now();
    final formattedDate = "${_getWeekday(date.weekday)}, ${_getMonth(date.month)} ${date.day}";

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 48, 24, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(formattedDate, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(username, style: TextStyle(fontWeight: FontWeight.bold, color: secTextColor)),
                  SizedBox(height: 8),
                  Text(
                    'DAILY AFFIRMATION\nYou are doing better than you think. Keep going.',
                    style: TextStyle(height: 1.4, color: secTextColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Album of the Week", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: List.generate(3, (index) {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 60,
                    decoration: BoxDecoration(
                      color: secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 80,
                    decoration: BoxDecoration(
                      color: secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Moodmeter", style: TextStyle(fontWeight: FontWeight.bold, color: secTextColor)),
                        SizedBox(height: 8),
                        Text("✓✓✓"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 80,
                    decoration: BoxDecoration(
                      color: secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Weather", style: TextStyle(fontWeight: FontWeight.bold, color: secTextColor)),
                        SizedBox(height: 8),
                        Text("☀️ 28°C Sunny", style: TextStyle(color: secTextColor),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }

  String _getWeekday(int weekday) {
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[weekday - 1];
  }

  String _getMonth(int month) {
    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July',
                    'August', 'September', 'October', 'November', 'December'];
    return months[month - 1];
  }
}
