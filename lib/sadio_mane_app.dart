import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/app/env_variable.dart';
import 'package:sadio_mane_store/core/constants/fonts_string.dart';
import 'package:sadio_mane_store/core/helpers/navigation_extension.dart';
import 'package:sadio_mane_store/core/internet_connection/cubit/internet_connection_cubit.dart';
import 'package:sadio_mane_store/core/internet_connection/screen/no_internet_screen.dart';
import 'package:sadio_mane_store/core/routes/app_routes.dart';
import 'package:sadio_mane_store/core/routes/routes_string.dart';
import 'package:sadio_mane_store/core/theme/font_weight_helper.dart';

class SadioManeApp extends StatelessWidget {
  const SadioManeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetConnectionCubit>(
          create: (context) => InternetConnectionCubit()..checkNetwork(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute,

          debugShowCheckedModeBanner: EnvVariable.getInstance.isDev,
          home: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
            builder: (context, state) {
              return state is NoInternetConnectionState
                  ? const NoInternetScreen()
                  : Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sadio Mane',
                            style: TextStyle(
                              fontFamily: FontsString.poppins,
                              fontWeight: FontWeightHelper.regular,
                              fontSize: 50,
                            ),
                          ),
                          Text(
                            'ساديو السنغالي',
                            style: TextStyle(
                              fontFamily: FontsString.cairo,
                              fontWeight: FontWeightHelper.medium,
                              fontSize: 50,
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              context.pushReplacement(
                                routeName:
                                    RoutesString.noInternetConnectionScreen,
                              );
                            },
                            child: const Icon(Icons.abc),
                          ),
                        ],
                      ),
                    ),
                  );
            },
          ),
        ),
      ),
    );
  }
}
