import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart' show module, lazySingleton;
import 'package:usecase/usecase.dart';

@module
abstract class AppBlocModule {
  @lazySingleton
  PopHandlerCubit injectPopHandlerCubit() => PopHandlerCubit();

  EntryCubit injectEntryCubit(EntryUsecase uc) => EntryCubit(uc);
}
