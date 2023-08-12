import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class MessageBubble extends StatelessWidget {
  final String? profileImageLink;
  final String message;
  final String dateTime;
  const MessageBubble({
    super.key,
    this.profileImageLink,
    required this.message,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    final isReceiver = profileImageLink != null;
    return BubbleSpecialOne(
      text: message,
      isSender: isReceiver,
      color: isReceiver
          ? const Color.fromARGB(255, 164, 164, 164)
          : const Color.fromARGB(255, 116, 116, 116),
      textStyle: const TextStyle(color: Colors.black),
      tail: true,
      delivered: true,
      seen: true,
      sent: true,
    );
  }
}
