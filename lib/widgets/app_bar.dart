import 'package:flutter/material.dart';
import 'package:piniary/screens/setting_screen.dart';

class PiniaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showSettingIcon;
  const PiniaryAppBar({
    super.key,
    this.showSettingIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      title: const Text('피니어리'),
      centerTitle: true,
      actions: [
        if (showSettingIcon)
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const SettingScreen();
                  },
                ),
              );
            },
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
