import 'package:flutter/material.dart';

class SearchInitial extends StatelessWidget {
  const SearchInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Start to search rhymes',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
            Text(
              'tap search field to start',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
