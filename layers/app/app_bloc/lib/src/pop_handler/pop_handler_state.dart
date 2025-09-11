part of 'pop_handler_cubit.dart';

@freezed
sealed class PopHandlerState with _$PopHandlerState{
  const factory PopHandlerState.initial() = _InitialState;

  const factory PopHandlerState.popRoute() = _PopRouteState;

  const factory PopHandlerState.keepRoute() = _KeepRoute;
}
