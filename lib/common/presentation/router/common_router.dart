import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skawa_bloc_test/common/presentation/screens/home_screen.dart';
import 'package:skawa_bloc_test/easy_concurrency/logic/bloc/character_bloc.dart';
import 'package:skawa_bloc_test/easy_concurrency/presentation/screens/easy_character_bloc.dart';

class CommonRouter {
  Route? onGenerateRoute(RouteSettings routesettings) {
    switch (routesettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case '/easyConcurrency':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<CharacterBloc>(
                  create: (context) => CharacterBloc(),
                  child: const EasyCharacterBlocScreen(),
                ));

      default:
        return null;
    }
  }
}
