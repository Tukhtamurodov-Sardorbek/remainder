import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart' show GetIt;

final class GetAppBloc {
  const GetAppBloc._();

  static EntryCubit entryCubit() => GetIt.I.get<EntryCubit>();

  static PopHandlerCubit popHandlerCubit() => GetIt.I.get<PopHandlerCubit>();
}
