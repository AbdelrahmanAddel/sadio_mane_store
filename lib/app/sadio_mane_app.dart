import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/app/env_variable.dart';
import 'package:sadio_mane_store/core/internet_connection/cubit/internet_connection_cubit.dart';
import 'package:sadio_mane_store/core/routes/app_routes.dart';
import 'package:sadio_mane_store/features/app_settings/cubit/app_settings_cubit.dart';
import 'package:sadio_mane_store/features/sign_up/presentation/view/sign_up_view.dart';
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
                (_, child) => MaterialApp(
                  locale: state.locale,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  theme: state.themeMode,
                  onGenerateRoute: AppRoutes.generateRoute,

                  debugShowCheckedModeBanner: EnvVariable.getInstance.isDev,
                  home: BlocBuilder<
                    InternetConnectionCubit,
                    InternetConnectionState
                  >(
                    builder: (context, state) {
                      return state is NoInternetConnectionState
                          ? const SignUpView()
                          : const SignUpView();
                    },
                  ),
                ),
          );
        },
      ),
    );
  }
}
