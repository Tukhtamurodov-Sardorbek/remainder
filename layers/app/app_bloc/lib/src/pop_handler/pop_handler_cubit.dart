import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pop_handler_state.dart';
part 'pop_handler_cubit.freezed.dart';

class PopHandlerCubit extends Cubit<PopHandlerState> {
  PopHandlerCubit() : super(PopHandlerState.initial());

  DateTime _lastPressed = DateTime(0);
  static const _maxDuration = Duration(seconds: 2);

  void updateState() {
    _lastPressed = DateTime(0);
    emit(const PopHandlerState.initial());
  }

  Future<void> handle() async {
    final now = DateTime.now();
    final isWarning = now.difference(_lastPressed) > _maxDuration;
    if (isWarning) {
      _lastPressed = DateTime.now();
      emit(const PopHandlerState.keepRoute());
    } else {
      emit(const PopHandlerState.popRoute());
    }
  }
}
