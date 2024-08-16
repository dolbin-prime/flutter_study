import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_label.g.dart';

@riverpod
class MyLabel extends _$MyLabel {
  @override
  String build() {
    return 'It\'s my label!';
  }

  void changeLabel() {
    if (state.endsWith('!')) {
      state = state.replaceFirst('!', '?');
    } else {
      state = state.replaceFirst('?', '!');
    }
  }
}

class MyLabelView extends ConsumerWidget {
  const MyLabelView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myLabel = ref.watch(myLabelProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(myLabel),
        TextButton(
            onPressed: () {
              ref.read(myLabelProvider.notifier).changeLabel();
            },
            child: const Text('peep!'))
      ],
    );
  }
}
