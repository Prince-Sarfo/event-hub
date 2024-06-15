import 'package:eventhub/pages/feed_page.dart';
import 'package:eventhub/pages/onboarding_page.dart';
import 'package:eventhub/pages/chat_page.dart';
import 'package:eventhub/pages/settings_page.dart';
import 'package:eventhub/pages/upload_page.dart';
import 'package:flutter/material.dart';
import './mydrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPageIndex = 0;
  List<Widget> pages = const [
    FeedPage(),
    UploadPage(),
    ChatPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: const [CircleAvatar()],
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'feed'),
            NavigationDestination(icon: Icon(Icons.upload), label: 'Upload'),
            NavigationDestination(icon: Icon(Icons.chat), label: 'message'),
            NavigationDestination(
                icon: Icon(Icons.settings_outlined), label: 'Settings')
          ]),
      body: pages.elementAt(currentPageIndex),
    );
  }
}
