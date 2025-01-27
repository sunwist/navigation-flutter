import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        backgroundColor: Color(0XFF8760c5),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      ),
      onPressed: onClicked,
      child: Text(text,style: TextStyle(color: Colors.white)),
    );
  }
}
