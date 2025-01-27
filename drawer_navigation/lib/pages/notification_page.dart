import 'package:flutter/material.dart';
import 'package:drawer_navigation/main.dart';

class NotificationPage extends StatelessWidget{
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigatorDrawer(),
      appBar: AppBar(
        title: const Text('Notifications', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF6441a1),
        iconTheme: const IconThemeData(
        color: Colors.white,
        ),
      ),
    );

  }
}
