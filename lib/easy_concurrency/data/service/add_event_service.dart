import 'package:skawa_bloc_test/easy_concurrency/data/model/character.dart';
import 'package:skawa_bloc_test/easy_concurrency/logic/bloc/character_bloc.dart';
import 'package:flutter/foundation.dart' show debugPrint;

const message = 'Skawa_Innovation_Ltd.';

class AddEventService {
  AddEventService._();
  static final _instance = AddEventService._();
  factory AddEventService.instance() => _instance;

  // track execution to dismiss context.pop when bloc.add() is in progress
  bool willPop = false;

  void addEvent(
      {required CharacterBloc bloc, required bool isSequential}) async {
    var _messageList = message.split('');

    for (int i = 0; i < _messageList.length; i++) {
      await Future.delayed(const Duration(seconds: 1));

      if (bloc.isClosed) {
        return;
      }

      if (!isSequential) {
        bloc.add(CharacterAddedEventNoTransformer(
            character: Character(character: _messageList[i])));
      } else {
        bloc.add(CharacterAddedEventSequentialTransformer(
            character: Character(character: _messageList[i])));
      }
    }
    willPop = true;
  }
}
