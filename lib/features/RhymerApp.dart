import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:realm/realm.dart';
import 'package:rhymer/bloc/theme/theme_cubit.dart';
import 'package:rhymer/features/FavouritesScreen/bloc/favourite_rhymes_bloc.dart';
import 'package:rhymer/features/HistoryScreen/bloc/history_rhymes_bloc.dart';
import 'package:rhymer/features/SearchScreen/bloc/rhymes_list_bloc.dart';
import 'package:rhymer/features/api/api.dart';
import 'package:rhymer/features/router/router.dart';
import 'package:rhymer/repositories/favourite_rhymes/favourite_rhymes.dart';
import 'package:rhymer/repositories/history_rhymes/history_rhymes.dart';
import 'package:rhymer/repositories/settings/settings.dart';
import 'package:rhymer/ui/ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RhymerApp extends StatelessWidget {

  const RhymerApp({
    super.key,
    required this.realm,
    required this.preferences
  });

  final Realm realm;
  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {

    final apiUrl = dotenv.env['API_URL'];
    final client = RhymesApiClient.create(apiUrl: apiUrl);
    final historyRhymesRepository = HistoryRhymesRepository(realm: realm);
    final favouriteRhymesRepository = FavouriteRhymesRepository(realm: realm);
    final settingsRepository = SettingsRepository(preferences: preferences);

    return MultiBlocProvider(
        providers: [
        BlocProvider(
            create: (context) =>
                RhymesListBloc(
                apiClient: client,
                historyRhymesRepository: historyRhymesRepository,
                favouriteRhymesRepository: favouriteRhymesRepository,
          ),
        ),
        BlocProvider(
            create: (context) =>
                FavouriteRhymesBloc(
                  favouriteRhymesRepository: favouriteRhymesRepository,
                ),
        ),
        BlocProvider(
            create: (context) =>
                HistoryRhymesBloc(
                  historyRhymesRepository: historyRhymesRepository,
                ),
        ),
        BlocProvider(
            create: (context) => ThemeCubit(settingsRepository: settingsRepository),
        ),
        ],
        child:
        BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp.router(
                theme: state.isDark ? darkTheme : lightTheme,
                routerConfig: AppRouter.router,
              );
            }
        )
    );
  }
}