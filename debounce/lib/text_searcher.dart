part of 'main.dart';

@riverpod
class TextInput extends _$TextInput {
  @override
  String build() {
    return '';
  }

  void setText(String text) {
    state = text;
  }
}

@riverpod
class AsyncTextMatchIndexes extends _$AsyncTextMatchIndexes {
  @override
  FutureOr<List<int>> build() async {
    // 입력된 text를 watching
    final textInput = ref.watch(textInputProvider);

/*
    // dispose 여부를 감지하기 위한 flag
    var didDispose = false;
    // dispose되면 flag를 true로 바꿈
    ref.onDispose(
      () => didDispose = true,
    );

    // 일치하는 지점을 찾는 동작을 시작하기 전에 일정 시간 지연시킴
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // 지연되는 동안 dispose 되었다면
    // (새로운 입력이 들어와서 rebuild 되었고
    // 이전의 입력값에 의한 provider는 dispose된 경우)
    if (didDispose) {
      // 예외를 통해 동작을 취소함
      throw Exception('debounce');
    }
*/
    // 마지막에 새롭게 build된 provider는 지연 후에 정상적으로 동작하게 됨
    if (textInput.isEmpty) {
      return [];
    } else {
      final regexp = RegExp(textInput);
      final matches = regexp.allMatches(longText);

      return matches.map((e) => e.start).toList();
    }
  }
}

class TextSearcher extends ConsumerStatefulWidget {
  const TextSearcher({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TextSearcherState();
}

class _TextSearcherState extends ConsumerState<TextSearcher> {
  @override
  Widget build(BuildContext context) {
    final matchIndexes = ref.watch(asyncTextMatchIndexesProvider);

    return Container(
        height: 150,
        width: 500,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Search: '),
                  Expanded(
                      child: TextField(
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) =>
                        ref.read(textInputProvider.notifier).setText(value),
                  )),
                ],
              ),
              RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                    const TextSpan(
                      text: 'Result: ',
                    ),
                    matchIndexes.when(
                        data: (data) => TextSpan(text: '${data.length}'),
                        error: (error, stackTrace) => const TextSpan(text: ''),
                        loading: () => const WidgetSpan(
                            child: CircularProgressIndicator()))
                  ])),
            ],
          ),
        ));
  }
}
