
import 'package:flutter/material.dart';

class BaseModalBottomSheet extends StatelessWidget {
  const BaseModalBottomSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 60),
      decoration: BoxDecoration(
        color: theme.canvasColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child:
      SizedBox(
        width: double.infinity,
        child: child,
      ),
    );
  }
}

