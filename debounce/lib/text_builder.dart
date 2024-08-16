part of 'main.dart';

class TextBuilder extends ConsumerWidget {
  const TextBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchIndexes = ref.watch(asyncTextMatchIndexesProvider);
    final textInput = ref.watch(textInputProvider);
    final inputLength = textInput.length;

    var currentIndex = 0;
    return matchIndexes.when(
        data: (data) {
          final textSpans = <TextSpan>[];
          for (final index in data) {
            textSpans.add(TextSpan(
                text: longText.substring(currentIndex, index),
                style: Theme.of(context).textTheme.bodyMedium));
            textSpans.add(TextSpan(
                text: longText.substring(index, index + inputLength),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(backgroundColor: Colors.amber.shade600)));
            currentIndex = index + inputLength;
          }

          textSpans.add(TextSpan(
              text: longText.substring(currentIndex),
              style: Theme.of(context).textTheme.bodyMedium));

          return RichText(text: TextSpan(children: textSpans));
        },
        error: (error, stackTrace) => const SizedBox.shrink(),
        loading: () => const Text(longText));
  }
}
