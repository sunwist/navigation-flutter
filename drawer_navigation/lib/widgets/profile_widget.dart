import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
        child: Stack(
      children: [
        buildImage(),
        Positioned(
          bottom: 0,
          right: 4,
          child: buildEditIcon(color),
        )
      ],
    ));
  }

  Widget buildImage() {
    final image = NetworkImage(widget.imagePath);

    return ClipOval(
        child: Material(
            color: Colors.transparent,
            child: Ink.image(
              image: image,
              fit: BoxFit.cover,
              width: 128,
              height: 128,
              child: InkWell(onTap: widget.onClicked),
            )));
  }

  Widget buildEditIcon(Color color) {
    return buildCircle(
      color: Colors.white,
      all: 3,
      child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
          )),
    );
  }

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
