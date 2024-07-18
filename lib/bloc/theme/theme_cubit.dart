import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhymer/repositories/settings/settings.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState>{
  ThemeCubit({
    required this.settingsRepository
  }) : super(ThemeState(brightness: Brightness.light)){
   _checkDarkThemeSelected();
  }

  final SettingsRepositoryInterface settingsRepository;

  void setThemeBrightness(Brightness brightness){
    emit(ThemeState(brightness: brightness));
    settingsRepository.setDarkThemeSelected(brightness == Brightness.dark);
  }

  Future<void> _checkDarkThemeSelected() async{
    final brightness = settingsRepository.isDarkThemeSelected() ? Brightness.dark : Brightness.light;
    emit(ThemeState(brightness: brightness));
  }
}