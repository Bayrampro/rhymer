import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rhymer/app/app.dart';
import 'package:rhymer/bloc/theme/theme_cubit.dart';
import 'package:rhymer/features/api/api.dart';
import 'package:rhymer/features/router/router.dart';
import 'package:rhymer/ui/ui.dart';

class RhymerApp extends StatelessWidget {
  const RhymerApp({
    super.key,
    required this.appConfig,
  });

  final AppConfig appConfig;

  @override
  Widget build(BuildContext context) {
    final apiUrl = dotenv.env['API_URL'];
    final client = RhymesApiClient.create(apiUrl: apiUrl);

    return AppInitializer(
      appConfig: appConfig,
      client: client,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: state.isDark ? darkTheme : lightTheme,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
