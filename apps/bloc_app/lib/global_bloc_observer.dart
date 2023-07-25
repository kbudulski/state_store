import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('ON EVENT');
    debugPrint('${bloc.runtimeType} | $event');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    debugPrint('ON CHANGE');
    debugPrint('${bloc.runtimeType} | current | ${change.currentState}');
    debugPrint('${bloc.runtimeType} | next    | ${change.nextState}');
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    debugPrint('ON TRANSITION');
    debugPrint('${bloc.runtimeType} | current | ${transition.currentState}');
    debugPrint('${bloc.runtimeType} | event   | ${transition.event}');
    debugPrint('${bloc.runtimeType} | next    | ${transition.nextState}');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    debugPrint('ON ERROR');
    debugPrint('${bloc.runtimeType} | error | $error');
    debugPrint('${bloc.runtimeType} | stack | $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
