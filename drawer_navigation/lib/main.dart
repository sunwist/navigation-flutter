import 'package:drawer_navigation/pages/notification_page.dart';
import 'package:drawer_navigation/pages/plugin_page.dart';
import 'package:drawer_navigation/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:drawer_navigation/pages/favorite_page.dart';
import 'package:drawer_navigation/pages/workflow_page.dart';
import 'package:drawer_navigation/pages/update_page.dart';
import 'package:drawer_navigation/utils/user_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF6441a1),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: const NavigatorDrawer(),
    );
  }
}

class NavigatorDrawer extends StatelessWidget {
  const NavigatorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }
}

Widget buildHeader(BuildContext context) {
  final user = UserPreferences.myUser;

  return Material(
    color: Color(0XFF8760c5),
    child: InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const UserPage(),
        ));
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: Column(
          children: [
            CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user.imagePath),
            ),
            const SizedBox(height: 12),
            Text(
              user.name,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(user.email, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    ),
  );
}

Widget buildMenuItems(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          ),
        ),
        ListTile(
            leading: const Icon(Icons.favorite_border),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const FavoritePage(),
              ));
            }),
        ListTile(
            leading: const Icon(Icons.workspaces_outlined),
            title: const Text('Workflow'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const WorkflowPage(),
              ));
            }),
        ListTile(
            leading: const Icon(Icons.update_outlined),
            title: const Text('Updates'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const UpdatePage(),
              ));
            }),
        const Divider(color: Colors.black),
        ListTile(
            leading: const Icon(Icons.account_tree_outlined),
            title: const Text('Plugins'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const PluginPage(),
              ));
            }),
        ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const NotificationPage(),
              ));
            }),
      ],
    ),
  );
}
