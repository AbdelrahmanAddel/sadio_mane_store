import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    final type = bloc is Cubit ? 'Cubit 🧱' : 'Bloc 🧩';
    debugPrint('🟢 [onCreate] $type created: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('📨 [onEvent] ${bloc.runtimeType} received event: $event');
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    debugPrint(
      '🔄 [onTransition] ${bloc.runtimeType} | '
      '${transition.currentState.runtimeType} 🔁 ${transition.nextState.runtimeType}',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint(
      '❌ [onError] ${bloc.runtimeType} threw error: $error\n🧵 StackTrace: $stackTrace',
    );
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    debugPrint('🔴 [onClose] ${bloc.runtimeType} is closed');
  }
}