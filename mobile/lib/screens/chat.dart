import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: const Color(0xFFC4161C),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Hyperpersonalizer_bot',
          style: TextStyle(
            color: Color(0xFFC4161C),
          ),
        ),
      ),
    );
  }
}
