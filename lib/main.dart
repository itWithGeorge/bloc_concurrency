import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skawa_bloc_test/easy_concurrency/logic/bloc/character_bloc.dart';
import 'package:skawa_bloc_test/easy_concurrency/presentation/screens/easy_character_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CharacterBloc>(
        create: (context) => CharacterBloc(),
        child: const EasyCharacterBlocScreen(),
      ),
    );
  }
}
