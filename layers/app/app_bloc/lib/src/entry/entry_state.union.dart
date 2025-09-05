// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_state.dart';

// **************************************************************************
// UnionGenerator
// **************************************************************************

sealed class EntryState extends Equatable {
  const EntryState._();
  const factory EntryState.initial() = _InitialState;
  const factory EntryState.notIntroduced() = _NotIntroducedState;
  const factory EntryState.introduced(String data) = _IntroducedState;
  T when<T>({
    required T Function() initial,
    required T Function() notIntroduced,
    required T Function(String data) introduced,
  }) {
    return switch (this) {
      _InitialState() => initial(),
      _NotIntroducedState() => notIntroduced(),
      _IntroducedState(:final data) => introduced(data),
    };
  }

  T? whenOrNull<T>({
    T Function()? initial,
    T Function()? notIntroduced,
    T Function(String data)? introduced,
  }) {
    return switch (this) {
      _InitialState() => initial?.call(),
      _NotIntroducedState() => notIntroduced?.call(),
      _IntroducedState(:final data) => introduced?.call(data),
    };
  }

  T maybeWhen<T>({
    T Function()? initial,
    T Function()? notIntroduced,
    T Function(String data)? introduced,
    required T Function() orElse,
  }) {
    return whenOrNull(
          initial: initial,
          notIntroduced: notIntroduced,
          introduced: introduced,
        ) ??
        orElse();
  }
}

final class _InitialState extends EntryState {
  const _InitialState() : super._();
  @override
  List<Object?> get props => [];
}

final class _NotIntroducedState extends EntryState {
  const _NotIntroducedState() : super._();
  @override
  List<Object?> get props => [];
}

final class _IntroducedState extends EntryState {
  final String data;
  const _IntroducedState(this.data) : super._();
  @override
  List<Object?> get props => [data];
}
