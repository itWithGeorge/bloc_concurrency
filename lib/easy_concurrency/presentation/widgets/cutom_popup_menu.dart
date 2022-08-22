import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skawa_bloc_test/easy_concurrency/data/model/character.dart';
import 'package:skawa_bloc_test/easy_concurrency/logic/bloc/character_bloc.dart';

enum CustomPopUpMenuItems {
  resetState,
  noTransfromer,
  sequential,
}

const message = 'Skawa_Innovation_Ltd.';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<CustomPopUpMenuItems>(
      itemBuilder: (_) => [
        const PopupMenuItem(
          value: CustomPopUpMenuItems.resetState,
          child: Text('reset state'),
        ),
        const PopupMenuItem(
          value: CustomPopUpMenuItems.noTransfromer,
          child: Text('No transformer'),
        ),
        const PopupMenuItem(
          value: CustomPopUpMenuItems.sequential,
          child: Text('sequential transformer'),
        ),
      ],
      onSelected: (selected) async {
        switch (selected) {
          case CustomPopUpMenuItems.resetState:
            context.read<CharacterBloc>().add(CharactersResetEvent());
            break;
          case CustomPopUpMenuItems.noTransfromer:
            var _messageList = message.split('');
            for (int i = 0; i < _messageList.length; i++) {
              await Future.delayed(const Duration(seconds: 1));
              context.read<CharacterBloc>().add(
                  CharacterAddedEventNoTransformer(
                      character: Character(character: _messageList[i])));
            }
            break;
          case CustomPopUpMenuItems.sequential:
            var _messageList = message.split('');
            for (int i = 0; i < _messageList.length; i++) {
              await Future.delayed(const Duration(seconds: 1));
              context.read<CharacterBloc>().add(
                  CharacterAddedEventSequentialTransformer(
                      character: Character(character: _messageList[i])));
            }
            break;
        }
      },
    );
  }
}
