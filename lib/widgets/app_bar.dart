import 'package:flutter/material.dart';
import 'package:piniary/screens/setting_screen.dart';
import 'package:piniary/screens/statistics_screen.dart';

class PiniaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showIcon;
  const PiniaryAppBar({
    super.key,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      title: const Text('피니어리'),
      centerTitle: true,
      actions: showIcon
          ? [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const StatisticsScreen(),
                  ),
                ),
                icon: const Icon(Icons.bar_chart),
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const SettingScreen(),
                    ),
                  );
                },
              )
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
