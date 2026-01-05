import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_puzzle/providers/size_provider/size_provider.dart';
import 'package:word_puzzle/widgets/crossword_widget.dart';

import '../providers/word_list_provider/word_list_provider.dart';

class _EagerInitialization extends ConsumerWidget {
  final Widget child;

  const _EagerInitialization({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(wordListProvider);

    return child;
  }
}

class _CrosswordGeneratorMenu extends ConsumerWidget {
  const _CrosswordGeneratorMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuAnchor(
      menuChildren: CrosswordSize.values
          .map(
            (size) => MenuItemButton(
              onPressed: () => ref.read(sizeProvider.notifier).setSize(size),
              leadingIcon: Icon(
                ref.watch(sizeProvider) == size
                    ? Icons.radio_button_checked_outlined
                    : Icons.radio_button_unchecked_outlined,
              ),
              child: Text(size.label),
            ),
          )
          .toList(),
    );
  }
}

class CrosswordGeneratorApp extends StatelessWidget {
  const CrosswordGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _EagerInitialization(
      child: Scaffold(
        appBar: AppBar(
          actions: [_CrosswordGeneratorMenu()],
          titleTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 16,
            fontWeight: .bold,
          ),
          title: Text('Crossword Generator'),
        ),
        body: SafeArea(child: CrosswordWidget()),
      ),
    );
  }
}
