import 'package:flutter/material.dart';
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

  void _modifyStreamData(String newData) => setState(() {
        _streamData = newData;
      });

  void _appendStreamData(String newData) => setState(() {
        _streamData += newData;
      });

  void _initPusreStream() {
    if (_streamData != '') {
      _modifyStreamData('');
    }
    FutureStremGenerator.instance().generateEasyStringStream().listen(
        _appendStreamData,
        onDone: () => debugPrint('_initPusreStream DONE'),
        onError: (error) => _modifyStreamData(error.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onPressed: _initPusreStream,
                      child: const Text('pure stream')),
                  Text(_streamData)
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
                      if (snapshot.connectionState == ConnectionState.active &&
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
    );
  }
}
