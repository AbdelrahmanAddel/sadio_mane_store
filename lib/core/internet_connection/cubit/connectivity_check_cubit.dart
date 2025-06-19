import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'connectivity_check_state.dart';

class ConnectivityCheckCubit extends Cubit<ConnectivityCheckState> {
  ConnectivityCheckCubit() : super(ConnectivityCheckInitial());

  StreamSubscription<InternetStatus>? _listener;

  void checkInternetConnectivity() {
    _listener = InternetConnection().onStatusChange.listen((
      InternetStatus status,
    ) {
      switch (status) {
        case InternetStatus.connected:
          emit(InternetConnection());
          break;
        case InternetStatus.disconnected:
          emit(NoInternetConnection());
          break;
      }
    });
  }

  @override
  Future<void> close() {
    _listener?.cancel();
    return super.close();
  }
}
