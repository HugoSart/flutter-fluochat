import 'package:fluochat/view/widgets/chat_item.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ChatItem(
          name: 'Hugo Sartori',
          lastMessage: 'Ao bixa',
          numberOfNewMessages: 1,
        ),
        ChatItem(
          name: 'João Ninguem',
          muted: true,
          numberOfNewMessages: 7,
        ),
        ChatItem(
          date: DateTime.now(),
        ),
        ChatItem(
          muted: true,
        ),
        ChatItem(),
        ChatItem(),
        ChatItem(),
        ChatItem(muted: true),
      ],
    );
  }
}
