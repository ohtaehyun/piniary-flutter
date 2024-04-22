import 'package:flutter/material.dart';

class PiniaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PiniaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      title: const Text('피니어리'),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
