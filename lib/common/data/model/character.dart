const message = 'Skawa_Innovation_Ltd.';
const messageWithCubit = 'Skawa_Inovation_Ltd.';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Character {
  final String character;

  Character({required this.character});

  Character.initial() : character = '';

  @override
  String toString() => character;

  @override
  bool operator ==(covariant Character other) {
    if (identical(this, other)) return true;

    return other.character == character;
  }

  @override
  int get hashCode => character.hashCode;
}
