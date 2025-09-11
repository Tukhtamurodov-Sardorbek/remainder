import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usecase/usecase.dart' show EntryUsecase;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry_state.dart';
part 'entry_cubit.freezed.dart';

class EntryCubit extends Cubit<EntryState> {
  final EntryUsecase _usecase;

  EntryCubit(this._usecase) : super(EntryState.initial());

  Future<void> _updateRunTime() => _usecase.saveRunTimes();

  Future<void> check() async {
    final times = await _usecase.runTimes;
    if (times == 0) {
      emit(const EntryState.notIntroduced());
    } else {
      emit(EntryState.introduced());
    }
    _updateRunTime();
  }
}
