import 'package:flutter/material.dart';

class AgileAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() onTap;
  final bool showSizeToggle;
  const AgileAppBar({super.key, required this.title, required this.icon, required this.onTap, required this.showSizeToggle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        if (showSizeToggle)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Center(
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    icon,
                    color: Theme.of(context).colorScheme.onSecondary,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
