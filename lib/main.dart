import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skawa_bloc_test/common/presentation/router/common_router.dart';
import 'package:skawa_bloc_test/common/utility/custom_bloc_observer.dart';

void main() {
  // deprecated
  /* BlocOverrides.runZoned(() => runApp(MyApp()),
      blocObserver: CustomBlocObserver()); */
  Bloc.observer = CustomBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final CommonRouter _router = CommonRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _router.onGenerateRoute,
    );
  }
}
