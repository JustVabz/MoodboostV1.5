import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  final String username;
  final String dailyAffirmation;

  const HomeScreen({
    Key? key,
    required this.username,
    required this.dailyAffirmation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F0D3),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Thursday, April 3",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9BA78C),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 200,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF9BA78C),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  username.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF1E9C1),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF9BA78C),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "DAILY AFFIRMATION",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    dailyAffirmation,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(color: Colors.black87),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Albums of the Week",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => albumButton(context, index)),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                infoCard("MoodMeter"),
                weatherCard("28°C", "Sunny"),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF9BA78C),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
    );
  }

  Widget albumButton(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AlbumDetailPage(index: index)),
          );
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFC9CDBA),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget infoCard(String title) {
    return Container(
      width: 120,
      height: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFC9CDBA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(title),
    );
  }

  Widget weatherCard(String temp, String description) {
    return Container(
      width: 120,
      height: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFC9CDBA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wb_sunny_outlined),
          Text(temp, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(description),
        ],
      ),
    );
  }
}

class AlbumDetailPage extends StatelessWidget {
  final int index;

  const AlbumDetailPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Album Detail #$index")),
      body: Center(child: Text("Details for album #$index")),
    );
  }
}
