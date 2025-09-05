import 'package:code_generator/code_generator.dart' show GenerateUnionHelpers;
import 'package:core/core.dart' show Equatable;

part 'entry_state.union.dart';

@GenerateUnionHelpers()
abstract class _EntryState {
  _EntryState.initial();

  _EntryState.notIntroduced();

  _EntryState.introduced(String data);
}
