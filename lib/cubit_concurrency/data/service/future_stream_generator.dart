import 'dart:async';

import 'package:skawa_bloc_test/common/data/model/character.dart';

class FutureStremGenerator {
  FutureStremGenerator._();
  static final _instance = FutureStremGenerator._();
  factory FutureStremGenerator.instance() => _instance;

  Stream<String> generateEasyStringStream() {
    List<String> _chars = message.split('');
    List<Future<String>> _futures = [];
    for (int i = 0; i < _chars.length; i++) {
      if (_chars[i] == 'w') {
        _futures.add(_futureFn(deleay: message.length, char: _chars[i]));
      } else {
        _futures.add(_futureFn(deleay: i, char: _chars[i]));
      }
    }
    return Stream<String>.fromFutures(_futures);
  }

  Future<String> _futureFn({required int deleay, required String char}) =>
      Future.delayed(Duration(seconds: deleay), () => char);
}
