import 'package:flutter/material.dart';
import 'package:skawa_bloc_test/common/data/model/character.dart';
import 'package:skawa_bloc_test/cubit_concurrency/data/service/future_stream_generator.dart';
import 'package:skawa_bloc_test/cubit_concurrency/logic/cubit/char_cubit.dart';

class EasyCharCubitScreen extends StatefulWidget {
  const EasyCharCubitScreen({Key? key}) : super(key: key);

  @override
  State<EasyCharCubitScreen> createState() => _EasyCharCubitScreenState();
}

class _EasyCharCubitScreenState extends State<EasyCharCubitScreen> {
  late CharCubit _charCubit;
  // placeholder for string literal from cubit
  String _data = '';
  // placeholder for string literal from pure stream
  String _streamData = '';

  bool _willPop = true;

  @override
  void initState() {
    super.initState();
    _charCubit = CharCubit();
  }

  @override
  void dispose() {
    _charCubit.close();
    super.dispose();
  }

  void _initPureStream() {
    if (!_willPop) {
      return;
    }
    _willPop = false;
    if (_streamData != '') {
      _streamData = '';
    }
    FutureStremGenerator.instance()
        .generateEasyStringStream()
        .listen((event) => debugPrint(_streamData += event), onDone: () {
      debugPrint('_initPusreStream DONE');
      _willPop = true;
    }, onError: (error) {
      debugPrint(error.toString());
      _willPop = true;
    }, cancelOnError: true);
  }

  Future<bool> _onWillPop() async {
    bool willPop =
        _willPop && _data == '' || _willPop && _data == messageWithCubit;
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: Text(willPop
                ? 'Now you are allowed to exit'
                : 'You are not allowed to exit - stream is open'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(willPop),
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
          title: const Text('Cubit concurrency'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: _initPureStream,
                        child: const Text('pure stream')),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () => _charCubit.addFutureChars(),
                        child: const Text('emit with cubit')),
                    StreamBuilder<CharState>(
                      stream: _charCubit.stream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.active &&
                            snapshot.hasData) {
                          _data += snapshot.data!.char;
                          return Text(_data);
                        }
                        // no need to hassle here...
                        return const CircularProgressIndicator();
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
