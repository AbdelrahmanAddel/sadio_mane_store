import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/app/env_variable.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_pref_key.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';
import 'package:sadio_mane_store/core/internet_connection/cubit/internet_connection_cubit.dart';
import 'package:sadio_mane_store/core/routes/app_routes.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/core/theme/app_theme.dart';
import 'package:sadio_mane_store/features/app_settings/cubit/app_settings_cubit.dart';
import 'package:sadio_mane_store/features/app_settings/cubit/app_settings_state.dart';
import 'package:sadio_mane_store/generated/l10n.dart';

class SadioManeApp extends StatelessWidget {
  const SadioManeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetConnectionCubit>(
          create: (context) => InternetConnectionCubit()..checkNetwork(),
        ),
        BlocProvider<AppSettingsCubit>(create: (context) => AppSettingsCubit()),
      ],
      child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(390, 844),
            minTextAdapt: true,
            splitScreenMode: true,
            builder:
                (context, child) => MaterialApp(
                  navigatorKey: getIt<GlobalKey<NavigatorState>>(),
                  initialRoute: RoutesString.categories,

                  locale:
                      SharedPrefHelper.getBool(SharedPrefKey.language)
                          ? const Locale('ar')
                          : const Locale('en'),

                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  theme:
                      SharedPrefHelper.getBool(SharedPrefKey.isDarkMode)
                          ? darkTheme
                          : lightTheme,
                  onGenerateRoute: AppRoutes.generateRoute,

                  debugShowCheckedModeBanner: EnvVariable.getInstance.isDev,
                ),
          );
        },
      ),
    );
  }
}

String getInitRoute() {
  final accessToken = SharedPrefHelper.getString(SharedPrefKey.accessToken);
  final userRole = SharedPrefHelper.getString(SharedPrefKey.userRole);
  if (accessToken != '') {
    return userRole == 'admin'
        ? RoutesString.adminHome
        : RoutesString.adminHome;
  } else {
    return RoutesString.signIn;
  }
}
