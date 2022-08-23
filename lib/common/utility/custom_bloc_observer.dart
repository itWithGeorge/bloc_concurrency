import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

class CustomBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    if (kDebugMode) {
      print('CustomBlocObserver onCreate ${bloc.toString()}');
    }
    super.onCreate(bloc);
  }

  // A Change represents the change from one State to another - consists of the currentState and nextState
// Now whenever a new state is emitted a Change occurs
  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print('CustomBlocObserver onChange $change');
    }
    super.onChange(bloc, change);
  }

// To track a bloc's error whenever it happens, just override the onError function within your bloc.
// onError is called whenever an error occurs and notifies BlocObserver.onError.
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('CustomBlocObserver onError $bloc $error');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    if (kDebugMode) {
      print('CustomBlocObserver onClose $bloc');
    }
    super.onClose(bloc);
  }
}
