import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:meta/meta.dart';

part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  InternetConnectionCubit() : super(InternetConnectionInitial());
  StreamSubscription<InternetStatus>? listener;
  void checkNetwork() {
    listener = InternetConnection().onStatusChange.listen((
      InternetStatus status,
    ) {
      switch (status) {
        case InternetStatus.connected:
          emit(InternetConnedtedState());

        case InternetStatus.disconnected:
          emit(NoInternetConnectionState());
      }
    });
  }

  @override
  Future<void> close() {
    listener?.cancel();
    return super.close();
  }
}
