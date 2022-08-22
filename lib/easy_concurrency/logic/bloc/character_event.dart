// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'character_bloc.dart';

abstract class CharacterEvent {
  const CharacterEvent();
}

@immutable
class CharacterAddedEventNoTransformer extends CharacterEvent {
  final Character character;
  const CharacterAddedEventNoTransformer({
    required this.character,
  });
}

@immutable
class CharacterAddedEventSequentialTransformer extends CharacterEvent {
  final Character character;
  const CharacterAddedEventSequentialTransformer({
    required this.character,
  });
}

@immutable
class CharactersResetEvent extends CharacterEvent {}
