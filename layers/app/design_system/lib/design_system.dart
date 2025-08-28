/// Design system library
library design_system;

import 'package:design_system/src/theme/impl/app_theme_impl.dart';

export 'package:flutter_svg/flutter_svg.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';

export 'src/assets/app_asset.dart';
export 'src/assets/svg.dart';
export 'src/colors/app_color.dart';
export 'src/constants/constants.dart';
export 'src/extensions/context_ext.dart';
export 'src/extensions/date_time.dart';
export 'src/extensions/string_ext.dart';
export 'src/extensions/text_style_ext.dart';
export 'src/extensions/widget.dart';
export 'src/widgets/app_stateful_widget.dart';
export 'src/widgets/app_stateless_widget.dart';

typedef AppThemeConfig = AppThemeImpl;
