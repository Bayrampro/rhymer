part of 'theme_cubit.dart';

class ThemeState extends Equatable{

  const ThemeState({required this.brightness});

  final Brightness brightness;

  bool get isDark => brightness == Brightness.dark;

  @override
  List<Object?> get props => [brightness];
}