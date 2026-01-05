import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'word_list_provider.g.dart';

@riverpod
Future<BuiltSet<String>> wordList(Ref ref) async {
  final re = RegExp(r'^[a-z]+$');

  final words = await rootBundle.loadString('assets/words.txt');

  return LineSplitter()
      .convert(words)
      .toBuiltSet()
      .rebuild((b) => b..map((word) => word.toLowerCase().trim()))
    ..where((word) => word.length > 2)
    ..where(re.hasMatch);
}
