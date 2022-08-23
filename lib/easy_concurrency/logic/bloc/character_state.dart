// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'character_bloc.dart';

abstract class CharacterState {
  final Character currentCharacter;
  const CharacterState({required this.currentCharacter});
}

@immutable
class CharacterInitialState extends CharacterState {
  CharacterInitialState() : super(currentCharacter: Character.initial());

  @override
  bool operator ==(other) {
    if (other is CharacterInitialState) {
      return currentCharacter == other.currentCharacter;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => currentCharacter.hashCode;

  @override
  String toString() => 'CharacterInitialState';
}

@immutable
class CharecterReceivedState extends CharacterState {
  final String characterReceived;

  CharecterReceivedState({required this.characterReceived})
      : super(currentCharacter: Character(character: characterReceived));

  @override
  bool operator ==(other) {
    if (other is CharecterReceivedState) {
      return currentCharacter == other.currentCharacter;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => characterReceived.hashCode;

  @override
  String toString() => 'CharecterReceivedState $characterReceived';
}
