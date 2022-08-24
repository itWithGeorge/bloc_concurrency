import 'package:bloc/bloc.dart';
import 'package:skawa_bloc_test/common/data/model/character.dart';

part 'char_state.dart';

class CharCubit extends Cubit<CharState> {
  CharCubit() : super(CharInitial());

  Future<String> _stringFn({required int delay, required String char}) =>
      Future.delayed(Duration(seconds: delay), () => char);

  void addFutureChars() async {
    for (var i = 0; i < message.length; i++) {
      if (message[i] == 'w') {
        emit(CharState(
            char: await _stringFn(delay: message.length, char: message[i])));
      } else {
        emit(CharState(char: await _stringFn(delay: 1, char: message[i])));
      }
    }
  }
}
