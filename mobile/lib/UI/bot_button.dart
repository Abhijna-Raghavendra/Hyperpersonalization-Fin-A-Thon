import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotButton extends StatelessWidget {
  const BotButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/chat');
      },
      backgroundColor: Colors.white,
      foregroundColor: const Color(0xFFC4161C),
      child: const FaIcon(FontAwesomeIcons.robot),
    );
  }
}
