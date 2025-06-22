import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/theme/app_theme.dart';

part 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit()
    : super(
        AppsettingsInitial(locale: const Locale('ar'), themeMode: lightTheme),
      );

  void toggleAppTheme({required ThemeData theme}) {
    emit(ToggleAppThemeState(themeMode: theme));
  }

  void changeAppLanguage(Locale locale) {
    emit(ChangeAppLanguageState(locale: locale));
  }
}
