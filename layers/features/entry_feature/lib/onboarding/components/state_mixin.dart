part of '../onboarding_page.dart';

mixin _StateHelper on State<OnboardPage> {
  int _previousPageIndex = 0;
  late final PageController _pageController;
  late final double _horizontalMargin = 14.r;
  late final ValueNotifier<int> _currentIndex;
  late final DerivedPageController _mirroredPageCtrl;
  late final DerivedValueNotifier<int, bool> _isInitial, _isLast;
  late final _animationDuration = const Duration(milliseconds: 500);

  final _data = [
    MapEntry(
      'Your health, on schedule'.needsToBeTranslated,
      'Take control of your well-being with effortless medication reminders.'
          .needsToBeTranslated,
    ),
    MapEntry(
      'Advanced reminders, Easy use'.needsToBeTranslated,
      'Stay on track with ease and peace of mind, ensuring you never miss a dose.'
          .needsToBeTranslated,
    ),
    MapEntry(
      'For yourself, family and friends'.needsToBeTranslated,
      'Easily manage medication for everyone you care about with seamless profile switching.'
          .needsToBeTranslated,
    ),
  ];

  ValueNotifier<int> get currentIndex => _currentIndex;

  String pageKey(int index) => 'page_$index';

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentIndex = ValueNotifier<int>(0);

    _mirroredPageCtrl = DerivedPageController(_pageController);
    _isInitial = DerivedValueNotifier<int, bool>(_currentIndex, (v) => v == 0);
    _isLast = DerivedValueNotifier<int, bool>(_currentIndex, (v) => v == 2);
  }

  @override
  void dispose() {
    _mirroredPageCtrl.dispose();
    _isInitial.dispose();
    _isLast.dispose();

    _pageController.dispose();
    _currentIndex.dispose();
    super.dispose();
  }

  void _updateCurrentPageIndex(int index) {
    _previousPageIndex = _currentIndex.value;
    _currentIndex.value = index;
  }

  void _toPreviousPage() {
    _updateCurrentPageIndex(_currentIndex.value - 1);
    _pageController.animateToPage(
      _currentIndex.value,
      curve: Curves.easeOutQuad,
      duration: _animationDuration,
    );
  }

  void _toNextPage() {
    _updateCurrentPageIndex(_currentIndex.value + 1);
    _pageController.animateToPage(
      _currentIndex.value,
      curve: Curves.easeOutQuad,
      duration: _animationDuration,
    );
  }

  void _toLastPage() {
    _updateCurrentPageIndex(2);
    _pageController.animateToPage(
      _currentIndex.value,
      curve: Curves.easeInQuad,
      duration: const Duration(milliseconds: 600),
    );
  }

  Future<void> _onPopInvoked(bool didPop, Object? result) async {
    if (didPop) {
      return;
    }
    if (_currentIndex.value == 0) {
      SystemNavigator.pop();
      // Navigator.of(context).pop(result);
    } else {
      _toPreviousPage();
    }
  }
}
