import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/helpers/extensions/navigation_extension.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/features/app_settings/cubit/app_settings_cubit.dart';

class ProfileToggleButtons {
  static Widget buildLanguageToggleButton(AppSettingsCubit appSettingsCubit) {
    return IconButton(
      onPressed: appSettingsCubit.changeLanguage,
      icon: const Icon(Icons.arrow_forward_ios),
    );
  }

  static Widget buildThemeToggleButton(
    AppSettingsCubit appSettingsCubit,
    bool isDarkMode,
  ) {
    return Transform.scale(
      scale: 0.9,
      child: Switch.adaptive(
        value: isDarkMode,
        onChanged: (_) => appSettingsCubit.changeAppTheme(),
      ),
    );
  }

  static Widget buildDeveloperToggleButton(BuildContext context) {
    return IconButton(
      onPressed: () => _navigateToDeveloperPage(context),
      icon: const Icon(Icons.arrow_forward_ios),
    );
  }

  static void _navigateToDeveloperPage(BuildContext context) {
    context.pushName(
      routeName: RoutesString.webView,
      arguments: 'https://en.wikipedia.org/wiki/Sadio_Man%C3%A9',
    );
  }
} 