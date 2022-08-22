import 'package:skawa_bloc_test/easy_concurrency/data/model/character.dart';
import 'package:skawa_bloc_test/easy_concurrency/logic/bloc/character_bloc.dart';

const message = 'Skawa_Innovation_Ltd.';

class AddEventService {
  AddEventService._();
  static final _instance = AddEventService._();
  factory AddEventService.instance() => _instance;

  void addEvent(
      {required CharacterBloc bloc, required bool isSequential}) async {
    var _messageList = message.split('');

    for (int i = 0; i < _messageList.length; i++) {
      await Future.delayed(const Duration(seconds: 1));
      if (!isSequential) {
        bloc.add(CharacterAddedEventNoTransformer(
            character: Character(character: _messageList[i])));
      } else {
        bloc.add(CharacterAddedEventSequentialTransformer(
            character: Character(character: _messageList[i])));
      }
    }
  }
}
