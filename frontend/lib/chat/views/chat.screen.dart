import 'package:flutter/material.dart';
import 'package:frontend/chat/widgets/message.bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        reverse: true,
        itemCount: _messages.length,
        itemBuilder: (BuildContext context, int index) {
          return _messages[index];
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
      ),
    );
  }
}

const _messages = <MessageBubble>[
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
  MessageBubble(
    profileImageLink: 'https://picsum.photos/250?image=9',
    message: 'Hello',
    dateTime: '12:00',
  ),
];
