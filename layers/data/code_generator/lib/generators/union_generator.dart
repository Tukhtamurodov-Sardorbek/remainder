import 'dart:async';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:code_generator/annotations/union_annotation.dart';

// class UnionGenerator extends GeneratorForAnnotation<GenerateUnionHelpers> {
//   @override
//   FutureOr<String> generateForAnnotatedElement(
//     Element element,
//     ConstantReader annotation,
//     BuildStep buildStep,
//   ) {
//     if (element is! ClassElement) return '';
//
//     final className = element.name;
//
//     final factories = element.constructors.where((c) => c.isFactory);
//
//     final subclasses = element.library.classes
//         .where(
//           (c) =>
//               c.supertype != null &&
//               c.supertype!.element == element &&
//               !c.isSealed,
//         )
//         .toList();
//
//     print('Factories:');
//     factories.forEach(print);
//     print('Subclasses');
//     subclasses.forEach(print);
//
//     // final subclasses = element.library.topLevelElements
//     //     .whereType<ClassElement>()
//     //     .where((c) => c.supertype != null && c.supertype!.element == element && c.isSealed == false)
//     //     .toList();
//     // final cases = subclasses.map((sub) {
//     //   final name = sub.name;
//     //   final factoryName = _factoryName(name);
//     //   return '$name() => $factoryName(),';
//     // }).join();
//
//     final whenArgs = subclasses.map((sub) {
//       final factoryName = _factoryName(sub.name);
//       return 'required T Function() $factoryName,';
//     }).join();
//
//     final whenSwitch = subclasses.map((sub) {
//       final name = sub.name;
//       final factoryName = _factoryName(name);
//       return '$name() => $factoryName(),';
//     }).join();
//
//     final whenOrNullArgs = subclasses.map((sub) {
//       final factoryName = _factoryName(sub.name);
//       return 'T Function()? $factoryName,';
//     }).join();
//
//     final whenOrNullSwitch = subclasses.map((sub) {
//       final name = sub.name;
//       final factoryName = _factoryName(name);
//       return '$name() => $factoryName?.call(),';
//     }).join();
//
//     final maybeWhenArgs = subclasses.map((sub) {
//       final factoryName = _factoryName(sub.name);
//       return 'T Function()? $factoryName,';
//     }).join();
//
//     return '''
// extension ${className}UnionExt on $className {
//   T when<T>({
//     $whenArgs
//   }) {
//     return switch (this) {
//       $whenSwitch
//     };
//   }
//
//   T? whenOrNull<T>({
//     $whenOrNullArgs
//   }) {
//     return switch (this) {
//       $whenOrNullSwitch
//     };
//   }
//
//   T maybeWhen<T>({
//     $maybeWhenArgs
//     required T Function() orElse,
//   }) {
//     return whenOrNull(
//       ${subclasses.map((s) => '${_factoryName(s.name)}: ${_factoryName(s.name)},').join()}
//     ) ?? orElse();
//   }
// }
// ''';
//   }
//
//   String _factoryName(String? className) {
//     final name = className ?? '_';
//
//     final result = name.startsWith('_')
//         ? name.substring(1).replaceAll('State', '')
//         : name.replaceAll('State', '');
//
//     return result[0].toLowerCase() + result.substring(1);
//   }
// }

class UnionGenerator extends GeneratorForAnnotation<GenerateUnionHelpers> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) return '';

    final className = _normalizeStateName(element.name ?? '_AbstractState');

    // Collect all factory constructors
    final factories = element.constructors;

    final buffer = StringBuffer();

    buffer.writeln('@immutable');
    buffer.writeln('sealed class $className extends Equatable {');
    buffer.writeln('const $className._();');

    for (final f in factories) {
      final classRef = _toPrivateState(f.name ?? 'unknown');
      final paramsDecl = _funcParamsDecl(f.formalParameters);
      print('>>> ${f.name} - ${f.displayName} => $classRef');
      buffer.writeln(
        'const factory $className.${f.name}($paramsDecl) = $classRef;',
      );
    }

    // when
    buffer.writeln('  T when<T>({');
    for (final f in factories) {
      final paramsDecl = _funcParamsDecl(f.formalParameters);
      buffer.writeln('    required T Function($paramsDecl) ${f.name},');
    }
    buffer.writeln('  }) {');
    buffer.writeln('    return switch (this) {');
    for (final f in factories) {
      final name = f.name;
      final classRef = _toPrivateState(name ?? 'unknown');
      final params = _patternParams(f.formalParameters);
      final call = _forwardParams(f.formalParameters);
      buffer.writeln('      $classRef($params) => $name($call),');
    }
    buffer.writeln('    };');
    buffer.writeln('  }');

    // whenOrNull
    buffer.writeln('  T? whenOrNull<T>({');
    for (final f in factories) {
      final paramsDecl = _funcParamsDecl(f.formalParameters);
      buffer.writeln('    T Function($paramsDecl)? ${f.name},');
    }
    buffer.writeln('  }) {');
    buffer.writeln('    return switch (this) {');
    for (final f in factories) {
      final name = f.name;
      final classRef = _toPrivateState(name ?? 'unknown');
      final params = _patternParams(f.formalParameters);
      final call = _forwardParams(f.formalParameters);
      buffer.writeln('      $classRef($params) => $name?.call($call),');
    }
    buffer.writeln('    };');
    buffer.writeln('  }');

    // maybeWhen
    buffer.writeln('  T maybeWhen<T>({');
    for (final f in factories) {
      final paramsDecl = _funcParamsDecl(f.formalParameters);
      buffer.writeln('    T Function($paramsDecl)? ${f.name},');
    }
    buffer.writeln('    required T Function() orElse,');
    buffer.writeln('  }) {');
    buffer.writeln('    return whenOrNull(');
    for (final f in factories) {
      final name = f.name;
      buffer.writeln('      $name: $name,');
    }
    buffer.writeln('    ) ?? orElse();');
    buffer.writeln('  }');

    buffer.writeln('}');

    // ===== Subclasses =====
    for (final f in factories) {
      final classRef = _toPrivateState(f.name ?? 'unknown');
      final params = f.formalParameters;

      buffer.writeln('final class $classRef extends $className {');
      if (params.isEmpty) {
        buffer.writeln('  const $classRef() : super._();');
      } else {
        // Fields
        for (final p in params) {
          final typeStr = (p.type).getDisplayString();
          buffer.writeln('  final $typeStr ${p.name};');
        }

        final paramDecls = params.map((p) => 'this.${p.name}').join(', ');
        buffer.writeln('  const $classRef($paramDecls) : super._();');
      }

      // props
      final props = params.isEmpty
          ? '[]'
          : '[${params.map((p) => p.name).join(", ")}]';
      buffer.writeln('  @override');
      buffer.writeln('  List<Object?> get props => $props;');
      buffer.writeln('}');
    }

    return buffer.toString();
  }

  // ===== Helpers =====
  String _funcParamsDecl(List<FormalParameterElement> params) =>
      params.map((p) => '${(p.type).getDisplayString()} ${p.name}').join(', ');

  String _patternParams(List<FormalParameterElement> params) =>
      params.isEmpty ? '' : ':final ${params.map((p) => p.name).join(", ")}';

  String _forwardParams(List<FormalParameterElement> params) =>
      params.map((p) => p.name).join(', ');

  String _toPrivateState(String input) {
    // Take only the part before the first "("
    final methodName = input.split('(').first.trim();

    // Capitalize the first letter
    final capitalized = methodName[0].toUpperCase() + methodName.substring(1);

    // Add underscore at the beginning and append 'State'
    return "_${capitalized}State";
  }

  String _normalizeStateName(String name) {
    // Remove leading underscore if present
    var result = name.replaceFirst(RegExp(r'^_'), '');

    // Remove trailing "Abs" if present
    result = result.replaceFirst(RegExp(r'Abs$'), '');

    // If it doesn't already end with "State", append it
    if (!result.endsWith('State') && !result.contains('State')) {
      result += 'State';
    }

    return result;
  }
}
