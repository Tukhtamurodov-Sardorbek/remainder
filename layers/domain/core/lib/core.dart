library core;

export 'package:core/di/micro_init.module.dart';

export 'package:get_it/get_it.dart';
export 'package:injectable/injectable.dart';
export 'package:auto_route/auto_route.dart';
export 'package:auto_route/annotations.dart';
export 'package:path_provider/path_provider.dart';

export 'package:core/src/app_details.dart';
export 'package:core/src/app_encrypted_data.dart';
export 'package:core/src/models/device_info.dart';

import 'package:path/path.dart' as p;

final class FilePath {
  FilePath._();

  static String build(String folderPath, String fileName) {
    return p.join(folderPath, fileName);
  }
}
