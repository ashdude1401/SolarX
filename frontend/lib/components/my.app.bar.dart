import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'SolarX Chat',
      ),
      actions: [
        // Call Button
        IconButton(
          icon: const Icon(Icons.call),
          onPressed: () {},
        ),
        // Video Call Button
        IconButton(
          icon: const Icon(Icons.video_call),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
