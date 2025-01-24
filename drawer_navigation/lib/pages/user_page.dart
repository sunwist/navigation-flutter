import 'package:drawer_navigation/utils/user_preferences.dart';
import 'package:drawer_navigation/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:drawer_navigation/main.dart';

class UserPage extends StatefulWidget{
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0XFF8760c5),
        ),
      ),
      drawer: const NavigatorDrawer(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
        ],
      ),
    );
  }
}
