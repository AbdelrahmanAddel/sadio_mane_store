part of 'app_settings_cubit.dart';

sealed class AppSettingsState extends Equatable {
  const AppSettingsState({required this.locale, required this.themeMode});

  final Locale? locale;
  final ThemeData? themeMode;
  @override
  List<Object?> get props => [locale, themeMode];
}

class AppsettingsInitial extends AppSettingsState {
  const AppsettingsInitial({required super.locale, required super.themeMode});
}

final class ToggleAppThemeState extends AppSettingsState {
  const ToggleAppThemeState({required super.themeMode, super.locale});
}

final class ChangeAppLanguageState extends AppSettingsState {
  const ChangeAppLanguageState({required super.locale, super.themeMode});
}
