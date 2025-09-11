import 'package:flutter/widgets.dart';

/// Keeps multiple [PageController]s in sync, with optional offset/page transforms.
/// final linker = PageControllerLinker();
///
/// late final controller1 = PageController();
/// late final controller2 = PageController();
///
/// @override
/// void initState() {
///   super.initState();
///   linker.addController(controller1);
///   linker.addController(controller2);
/// }
///
/// @override
/// void dispose() {
///   linker.dispose();
///   super.dispose();
/// }
class PageControllerLinker {
  final List<PageController> _controllers = [];
  final double Function(double offset)? offsetTransform;
  final double Function(double page)? pageTransform;

  bool _isSyncing = false;

  PageControllerLinker({this.offsetTransform, this.pageTransform});

  void addController(PageController controller) {
    _controllers.add(controller);
    controller.addListener(() => _onScroll(controller));
  }

  void removeController(PageController controller) {
    _controllers.remove(controller);
  }

  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    _controllers.clear();
  }

  void _onScroll(PageController source) {
    if (_isSyncing) return;

    _isSyncing = true;
    final rawOffset = source.offset;
    final rawPage = source.page ?? 0.0;

    final transformedOffset = offsetTransform?.call(rawOffset) ?? rawOffset;
    final transformedPage = pageTransform?.call(rawPage) ?? rawPage;

    for (final c in _controllers) {
      if (c == source || !c.hasClients) continue;

      if (c.position.haveDimensions) {
        // choose between jumpTo and animateTo if you want animations
        c.jumpTo(transformedOffset);
      }
    }
    _isSyncing = false;
  }
}

/// A PageController that derives its offset/page from another PageController,
/// applying optional transforms.
class DerivedPageController extends PageController {
  final PageController _source;
  final double Function(double offset)? offsetTransform;
  final double Function(double page)? pageTransform;

  VoidCallback? _listener;
  bool _isSyncing = false;

  DerivedPageController(
    this._source, {
    this.offsetTransform,
    this.pageTransform,
    super.keepPage,
    super.initialPage = 0,
  }) {
    _listener = _onSourceScroll;
    _source.addListener(_listener!);
  }

  void _onSourceScroll() {
    if (!hasClients || _isSyncing) return;

    _isSyncing = true;
    final rawOffset = _source.offset;
    final rawPage = _source.page ?? 0.0;

    final transformedOffset = offsetTransform?.call(rawOffset) ?? rawOffset;
    final transformedPage = pageTransform?.call(rawPage) ?? rawPage;

    // If dimensions are ready, sync
    if (position.haveDimensions) {
      // keep it snappy: no animation, just jump
      jumpTo(transformedOffset);
    }

    _isSyncing = false;
  }

  @override
  void dispose() {
    if (_listener != null) {
      _source.removeListener(_listener!);
    }
    super.dispose();
  }
}
