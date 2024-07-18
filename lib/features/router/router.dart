import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rhymer/features/FavouritesScreen/Favourites.dart';
import 'package:rhymer/features/HomeScreen/Home.dart';
import 'package:rhymer/features/HistoryScreen/History.dart';
import 'package:rhymer/features/SettingsScreen/Settings.dart';
import '../SearchScreen/Search.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return HomeScreen(child: child,);
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'search',
            builder: (context, state) => SearchScreen(),
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: SearchScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            path: '/favourites',
            name: 'favourites',
            builder: (context, state) => FavouritesScreen(),
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                  key: state.pageKey,
                  child: FavouritesScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  }
              );
            }
          ),
          GoRoute(
            path: '/poem',
            name: 'poem',
            builder: (context, state) => HistoryScreen(),
            pageBuilder: (context, state) {
                return CustomTransitionPage(
                    key: state.pageKey,
                    child: HistoryScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    }
                );
              }
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) => SettingsScreen(),
            pageBuilder: (context, state) {
                return CustomTransitionPage(
                    key: state.pageKey,
                    child: SettingsScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    }
                );
              }
          ),
        ],
      ),
    ],
  );

  static int getCurrentIndex(BuildContext context) {

    final GoRouterState state = GoRouterState.of(context);
    switch (state.fullPath) {
      case '/':
        return 0;
      case '/favourites':
        return 1;
      case '/poem':
        return 2;
      case '/settings':
        return 3;
      default:
        return 0;
    }

  }

  static void onTabTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/favourites');
        break;
      case 2:
        context.go('/poem');
        break;
      case 3:
        context.go('/settings');
        break;
    }
  }
}
