import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];

  final List<types.User> _users = [
    const types.User(
      id: '1',
    ),
    const types.User(
      id: '2',
    )
  ];

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _users[0],
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    final replyMessage = types.TextMessage(
      author: _users[1],
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: 'reply to ${message.text}',
    );

    setState(() {
      _messages.insert(0, textMessage);
      _messages.insert(0, replyMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC4161C),
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        title: const Text('Chat with '),
        centerTitle: true,
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _users[0],
        theme: DefaultChatTheme(
          primaryColor: const Color(0xFFC4161C),
          inputBorderRadius: BorderRadius.all(Radius.circular(18.r)),
          inputMargin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.h),
          inputBackgroundColor: neutral0,
        ),
      ),
    );
  }
}
