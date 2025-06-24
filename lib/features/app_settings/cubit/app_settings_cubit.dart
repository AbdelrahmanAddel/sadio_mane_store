import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/constants/fonts_string.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_pref_key.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';
import 'package:sadio_mane_store/features/app_settings/cubit/app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit() : super(const AppSettingsState.initial());

  Future<void> changeLanguage() async {
    await SharedPrefHelper.setData(
      SharedPrefKey.language,
      !SharedPrefHelper.getBool(SharedPrefKey.language),
    );
    final isArabic = SharedPrefHelper.getBool(SharedPrefKey.language);

    await SharedPrefHelper.setData(
      SharedPrefKey.fontFamily,
      isArabic ? FontsString.cairo : FontsString.poppins,
    );
    emit(AppSettingsState.changeLanguage(isArabic: isArabic));
  }

  Future<void> changeAppThmem() async {
    await SharedPrefHelper.setData(
      SharedPrefKey.isDarkMode,
      !SharedPrefHelper.getBool(SharedPrefKey.isDarkMode),
    );

    emit(
      AppSettingsState.changeTheme(
        isDarkMode: SharedPrefHelper.getBool(SharedPrefKey.isDarkMode),
      ),
    );
  }
}
