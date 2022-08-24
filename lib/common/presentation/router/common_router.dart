import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skawa_bloc_test/common/presentation/screens/home_screen.dart';
import 'package:skawa_bloc_test/bloc_concurrency/logic/bloc/character_bloc.dart';
import 'package:skawa_bloc_test/bloc_concurrency/presentation/screens/easy_character_bloc.dart';
import 'package:skawa_bloc_test/cubit_concurrency/presentation/screens/easy_char_cubit.dart';

class CommonRouter {
  Route? onGenerateRoute(RouteSettings routesettings) {
    switch (routesettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case '/easyConcurrency':
        // CharacterBloc is scoped - WillPopScope should handle carefully!
        return MaterialPageRoute(
            builder: (_) => BlocProvider<CharacterBloc>(
                  create: (context) => CharacterBloc(),
                  child: const EasyCharacterBlocScreen(),
                ));

      case '/easyCubit':
        return MaterialPageRoute(builder: (_) => const EasyCharCubitScreen());

      default:
        return null;
    }
  }
}
