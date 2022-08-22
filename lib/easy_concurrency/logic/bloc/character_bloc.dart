import 'dart:math' show Random;

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:skawa_bloc_test/easy_concurrency/data/model/character.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitialState()) {
    on<CharactersResetEvent>(_onCharactersResetEvent);
    on<CharacterAddedEventNoTransformer>(_onCharacterAddedEventNoTransformer);
    on<CharacterAddedEventSequentialTransformer>(
        _onCharacterAddedEventSequentialTransformer,
        transformer: sequential());
  }

  void _onCharactersResetEvent(_, Emitter<CharacterState> emitter) {
    emitter(CharacterInitialState());
  }

  Future<void> _onCharacterAddedEventNoTransformer(
      CharacterAddedEventNoTransformer event,
      Emitter<CharacterState> emitter) async {
    final String _current = state.currentCharacter.character;
    final String _received = event.character.character;
    var _appended = _current + _received;
    await Future.delayed(Duration(seconds: Random().nextBool() ? 0 : 2),
        () => emitter(CharecterReceivedState(characterReceived: _appended)));
  }

  Future<void> _onCharacterAddedEventSequentialTransformer(
      CharacterAddedEventSequentialTransformer event,
      Emitter<CharacterState> emitter) async {
    final String _current = state.currentCharacter.character;
    final String _received = event.character.character;
    var _appended = _current + _received;
    await Future.delayed(Duration(seconds: Random().nextBool() ? 0 : 2),
        () => emitter(CharecterReceivedState(characterReceived: _appended)));
  }
}
