import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skawa_bloc_test/easy_concurrency/logic/bloc/character_bloc.dart';
import 'package:skawa_bloc_test/easy_concurrency/presentation/widgets/cutom_popup_menu.dart';

class EasyCharacterBlocScreen extends StatefulWidget {
  const EasyCharacterBlocScreen({Key? key}) : super(key: key);

  @override
  State<EasyCharacterBlocScreen> createState() =>
      _EasyCharacterBlocScreenState();
}

class _EasyCharacterBlocScreenState extends State<EasyCharacterBlocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Character screen'),
        actions: const [
          CustomPopupMenu(),
        ],
      ),
      body: Center(
        child: BlocBuilder<CharacterBloc, CharacterState>(
            builder: (context, state) {
          if (state is CharacterInitialState) {
            return Text(state.currentCharacter.character);
          } else if (state is CharecterReceivedState) {
            return Text(state.currentCharacter.character);
          }
          return const CircularProgressIndicator();
        }),
      ),
    );
  }
}
