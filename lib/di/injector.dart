import 'package:app_bloc/app_bloc.dart';
import 'package:backend_services/backend_services.dart';
import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:navigation/navigation.dart';
import 'package:remainder/di/injector.config.dart';
import 'package:repository/repository.dart';
import 'package:usecase/usecase.dart';

final locator = GetIt.instance;

@InjectableInit(
  asExtension: true,
  initializerName: 'init',
  preferRelativeImports: true,
  externalPackageModulesBefore: [
    ExternalModule(CorePackageModule),
    ExternalModule(AppBlocPackageModule),
    ExternalModule(NavigationPackageModule),
    ExternalModule(RepositoryPackageModule),
    ExternalModule(UsecasePackageModule),
    ExternalModule(DatabasePackageModule),
    ExternalModule(BackendServicesPackageModule),
  ],
)
Future<GetIt> configureDependencies() => locator.init();
