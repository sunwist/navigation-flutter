import 'package:flutter/material.dart';
import 'package:drawer_navigation/pages/favorite_page.dart';

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
        title: const Text('Home',
        style: TextStyle(
          fontWeight: FontWeight.bold,
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
      backgroundColor: Color(0XFF8760c5),
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
  return Container(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
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
          leading: const Icon(Icons.home_outlined, color: Colors.white),
          title: const Text('Home', style: TextStyle(color: Colors.white)),
          onTap: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.favorite_border, color: Colors.white),
          title: const Text('Favorites', style: TextStyle(color: Colors.white),),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const FavoritePage(),
            ));
          }
        ),
        ListTile(
          leading: const Icon(Icons.workspaces_outlined, color: Colors.white),
          title: const Text('Workflow', style: TextStyle(color: Colors.white),),
          onTap: () {}
        ),
        ListTile(
          leading: const Icon(Icons.update_outlined, color: Colors.white),
          title: const Text('Updates', style: TextStyle(color: Colors.white),),
          onTap: () {}
        ),
      ],
    ),
  );
}
