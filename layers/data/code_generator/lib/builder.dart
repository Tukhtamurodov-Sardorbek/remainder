import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'generators/union_generator.dart';

Builder unionBuilder(BuilderOptions options) {
  return PartBuilder([UnionGenerator()], '.union.dart');
}
