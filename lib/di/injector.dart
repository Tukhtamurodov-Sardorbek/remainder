import 'package:core/core.dart';
import 'package:remainder/di/injector.config.dart';
import 'package:app_bloc/app_bloc.dart';
import 'package:navigation/navigation.dart';
import 'package:backend_services/backend_services.dart';
import 'package:database/database.dart';
import 'package:repository/repository.dart';
import 'package:usecase/usecase.dart';

// import 'package:app_analytics/app_analytics.dart';
// import 'package:biometry/biometry.dart';
// import 'package:core/core.dart';
// import 'package:humo_pay/humo_pay.dart';
// import 'package:my_home_widget/my_home_widget.dart';
// import 'package:navigation/navigation.dart';
// import 'package:network/network.dart';
// import 'package:notification_service/notification_service.dart';
//
// import 'package:tenge24_f/di/injector.config.dart';
//

final locator = GetIt.instance;

@InjectableInit(
  asExtension: true,
  initializerName: 'init',
  preferRelativeImports: true,
  externalPackageModulesBefore: [
    ExternalModule(AppBlocPackageModule),
    ExternalModule(NavigationPackageModule),
    ExternalModule(BackendServicesPackageModule),
    ExternalModule(DatabasePackageModule),
    ExternalModule(CorePackageModule),
    ExternalModule(RepositoryPackageModule),
    ExternalModule(UsecasePackageModule),

    // ExternalModule(BiometryPackageModule),
    // ExternalModule(NetworkPackageModule),
    // ExternalModule(HumoPayPackageModule),
    //
    // ExternalModule(MyHomeWidgetPackageModule),
    // ExternalModule(NotificationServicePackageModule),
    // ExternalModule(AppAnalyticsPackageModule),
  ],
)
void configureDependencies() => locator.init();
