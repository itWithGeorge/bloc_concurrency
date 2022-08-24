// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'char_cubit.dart';

class CharState {
  final String char;
  const CharState({required this.char});

  @override
  bool operator ==(covariant CharState other) {
    if (identical(this, other)) return true;

    return other.char == char;
  }

  @override
  int get hashCode => char.hashCode;

  @override
  String toString() => 'CharState(char: $char)';
}

class CharInitial extends CharState {
  CharInitial() : super(char: '');
}
