
import 'package:flutter/material.dart';

class SettingsAction extends StatefulWidget {
  const SettingsAction({
    Key? key,
    required this.title,
    required this.iconData,
    this.iconColor,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final Color? iconColor;
  final VoidCallback onTap;

  @override
  State<SettingsAction> createState() => _SettingsActionState();
}

class _SettingsActionState extends State<SettingsAction> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 12).copyWith(top: 8),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: theme.textTheme.titleMedium,
            ),
            Icon(
              widget.iconData,
              size: 35,
              color: widget.iconColor ?? theme.hintColor.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }
}
