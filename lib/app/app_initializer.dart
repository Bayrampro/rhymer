import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymer/bloc/theme/theme_cubit.dart';
import 'package:rhymer/features/api/api.dart';
import 'package:rhymer/repositories/favourite_rhymes/favourite_rhymes.dart';
import 'package:rhymer/repositories/history_rhymes/history_rhymes.dart';
import 'package:rhymer/repositories/settings/settings.dart';

import 'package:rhymer/features/FavouritesScreen/bloc/favourite_rhymes_bloc.dart';
import 'package:rhymer/features/HistoryScreen/bloc/history_rhymes_bloc.dart';
import 'package:rhymer/features/SearchScreen/bloc/rhymes_list_bloc.dart';

import 'app.dart';

class AppInitializer extends StatelessWidget {
  const AppInitializer({
    super.key,
    required this.child,
    required this.appConfig,
    required this.client,
  });

  final AppConfig appConfig;
  final RhymesApiClient client;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HistoryRhymesInterface>(
          create: (context) => HistoryRhymesRepository(realm: appConfig.realm),
        ),
        RepositoryProvider<FavouriteRhymesInterface>(
          create: (context) =>
              FavouriteRhymesRepository(realm: appConfig.realm),
        ),
        RepositoryProvider<SettingsRepositoryInterface>(
          create: (context) =>
              SettingsRepository(preferences: appConfig.preferences),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RhymesListBloc(
              apiClient: client,
              historyRhymesRepository: context.read<HistoryRhymesInterface>(),
              favouriteRhymesRepository:
                  context.read<FavouriteRhymesInterface>(),
            ),
          ),
          BlocProvider(
            create: (context) => FavouriteRhymesBloc(
              favouriteRhymesRepository:
                  context.read<FavouriteRhymesInterface>(),
            ),
          ),
          BlocProvider(
            create: (context) => HistoryRhymesBloc(
              historyRhymesRepository: context.read<HistoryRhymesInterface>(),
            ),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(
              settingsRepository: context.read<SettingsRepositoryInterface>(),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
