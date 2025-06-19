import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/app/env_variable.dart';
import 'package:sadio_mane_store/core/internet_connection/cubit/internet_connection_cubit.dart';
import 'package:sadio_mane_store/core/internet_connection/screen/no_internet_screen.dart';

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
      child: MaterialApp(
        debugShowCheckedModeBanner: EnvVariable.getInstance.isDev,
        home: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
          builder: (context, state) {
            return state is NoInternetConnectionState
                ? const NoInternetScreen()
                : const Scaffold();
          },
        ),
      ),
    );
  }
}
