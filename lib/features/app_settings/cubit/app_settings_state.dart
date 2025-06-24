// part of 'app_settings_cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings_state.freezed.dart';

@freezed
class AppSettingsState with _$AppSettingsState {
  const factory AppSettingsState.initial() = _Initial;
  const factory AppSettingsState.changeTheme({required bool isDarkMode}) =
      ChangeThemeState;
  const factory AppSettingsState.changeLanguage({required bool isArabic}) =
      ChangeLanguageState;
}
