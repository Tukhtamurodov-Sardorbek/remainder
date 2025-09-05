import 'package:app_bloc/src/entry/entry_cubit.dart';
import 'package:core/core.dart';
import 'package:usecase/usecase.dart';

@module
abstract class AppBlocModule {
  EntryCubit injectEntryCubit(EntryUsecase usecase) {
    return EntryCubit(usecase);
  }
}
