import 'package:flutter/material.dart';
import 'bottom_nav.dart';

class ReflectionsPage extends StatelessWidget {
  const ReflectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 48, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Daily Reflections", style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            )),
            const SizedBox(height: 16),
            const Text("What are you grateful for today?"),
            const SizedBox(height: 12),
            Expanded(
              child: TextField(
                controller: controller,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  hintText: "Write here...",
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Reflection submitted!")),
                  );
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
