import 'package:flutter/material.dart';
import 'package:rhymer/features/router/router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.child});
  final Widget child;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: theme.hintColor,
        onTap: (index) => AppRouter.onTabTapped(index, context),
        currentIndex: AppRouter.getCurrentIndex(context),
        backgroundColor: theme.canvasColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}