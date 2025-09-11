part of '../onboarding_page.dart';

mixin _StateHelper on State<OnboardPage> {
  late final PageController _pageController;
  late final ValueNotifier<int> _currentIndex;
  late final DerivedPageController _mirroredPageCtrl;
  late final DerivedValueNotifier<int, bool> _isInitial, _isLast;

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

  void _toPreviousPage() {
    _currentIndex.value -= 1;
    _pageController.animateToPage(
      _currentIndex.value,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
    );
  }

  void _toNextPage() {
    _currentIndex.value += 1;
    _pageController.animateToPage(
      _currentIndex.value,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
    );
  }

  void _toLastPage() {
    _currentIndex.value = 2;
    _pageController.animateToPage(
      _currentIndex.value,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
    );
  }
}
