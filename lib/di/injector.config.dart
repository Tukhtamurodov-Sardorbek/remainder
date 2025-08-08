// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_bloc/app_bloc.dart' as _i995;
import 'package:backend_services/backend_services.dart' as _i151;
import 'package:core/core.dart' as _i494;
import 'package:database/database.dart' as _i252;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:navigation/navigation.dart' as _i1058;
import 'package:repository/repository.dart' as _i585;
import 'package:usecase/usecase.dart' as _i211;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    await _i494.CorePackageModule().init(gh);
    await _i995.AppBlocPackageModule().init(gh);
    await _i1058.NavigationPackageModule().init(gh);
    await _i585.RepositoryPackageModule().init(gh);
    await _i211.UsecasePackageModule().init(gh);
    await _i252.DatabasePackageModule().init(gh);
    await _i151.BackendServicesPackageModule().init(gh);
    return this;
  }
}
