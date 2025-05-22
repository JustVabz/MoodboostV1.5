import 'package:flutter/material.dart';
import 'package:app1/config/theme.dart';
import 'package:app1/pages/login_page.dart';
import 'package:app1/pages/signup_page.dart';
import 'package:app1/pages/home_page.dart';
import 'package:app1/pages/explore_page.dart';
import 'package:app1/pages/cheerbot_page.dart';
import 'package:app1/pages/reflections_page.dart';
import 'package:app1/pages/profile_page.dart';
import 'package:app1/pages/music_page.dart';
import 'package:app1/pages/settings_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MoodBoostApp());
}

class MoodBoostApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoodBoost',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
        '/explore': (context) => ExplorePage(),
        '/chatbot': (context) => ChatBotPage(),
        '/reflections': (context) => ReflectionsPage(),
        '/profile': (context) => ProfilePage(),
        '/music': (context) => MusicPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
