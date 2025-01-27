import 'package:flutter/material.dart';
import 'package:drawer_navigation/main.dart';

class PluginPage extends StatelessWidget{
  const PluginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigatorDrawer(),
      appBar: AppBar(
        title: const Text('Plugins', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF6441a1),
        iconTheme: const IconThemeData(
        color: Colors.white,
        ),
      ),
    );

  }
}
