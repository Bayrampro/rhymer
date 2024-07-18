
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rhymer/ui/theme/theme.dart';

class SettingsToggle extends StatefulWidget {
  const SettingsToggle({
    Key? key,
    required this.value,
    this.onChanged,
    required this.title
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool>? onChanged;
  final String title;

  @override
  State<SettingsToggle> createState() => _SettingsToggleState();
}

class _SettingsToggleState extends State<SettingsToggle> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
          if(theme.isAndroid)
            Switch(
              value: widget.value,
              onChanged: widget.onChanged,
            )
          else
            CupertinoSwitch(
              value: widget.value,
              onChanged: widget.onChanged,
            )
        ],
      ),
    );
  }
}
