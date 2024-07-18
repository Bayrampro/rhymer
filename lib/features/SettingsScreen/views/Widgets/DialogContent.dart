import 'package:flutter/material.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({
    required this.crossAxisAlignment
  });

  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Are you sure?',
          style: TextStyle(
              fontSize: 22
          ),
        ),
        Text(
          'All data will remove beyond retrieve',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

