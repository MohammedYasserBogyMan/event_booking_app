import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log("🟢 onCreate → $bloc");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log("🔄 onChange → $bloc, change: $change");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log("📩 onEvent → $bloc, event: $event");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log("🚀 onTransition → $bloc, transition: $transition");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log("❌ onError → $bloc, error: $error");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log("🔴 onClose → $bloc");
  }
}
