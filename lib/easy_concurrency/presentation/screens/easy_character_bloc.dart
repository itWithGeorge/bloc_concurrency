import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skawa_bloc_test/easy_concurrency/data/service/add_event_service.dart';
import 'package:skawa_bloc_test/easy_concurrency/logic/bloc/character_bloc.dart';
import 'package:skawa_bloc_test/easy_concurrency/presentation/widgets/cutom_popup_menu.dart';

class EasyCharacterBlocScreen extends StatefulWidget {
  const EasyCharacterBlocScreen({Key? key}) : super(key: key);

  @override
  State<EasyCharacterBlocScreen> createState() =>
      _EasyCharacterBlocScreenState();
}

class _EasyCharacterBlocScreenState extends State<EasyCharacterBlocScreen> {
  Future<bool> _onWillPop() async {
    final _isClosed = AddEventService.instance().willPop;
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: Text(_isClosed
                ? 'Now you are allowed to exit'
                : 'You are not allowed to exit - bloc.add() is in progress'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(_isClosed),
                child: const Text('OK'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
            return const Text('NOGO for sure!');
          }),
        ),
      ),
    );
  }
}
