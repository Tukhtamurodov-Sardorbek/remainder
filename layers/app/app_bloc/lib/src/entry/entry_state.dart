part of 'entry_cubit.dart';

@freezed
sealed class EntryState with _$EntryState{
  const factory EntryState.initial() = _InitialState;

  const factory EntryState.notIntroduced() = _NotIntroducedState;

  const factory EntryState.introduced() = _IntroducedState;
}
