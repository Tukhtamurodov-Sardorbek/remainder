import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart' show RoutePage;
import 'package:navigation/navigation.dart' show GetAppNavigator;

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AppStatefulMixin {
  bool _canNavigate = false;
  EntryState? _bufferedState;
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onResume: () {
        context.read<PopHandlerCubit>().updateState();
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EntryCubit>().check();
    });
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // In case the state was already emitted before listener mounted
  //   final currentState = context.read<EntryCubit>().state;
  //   _bufferedState = currentState;
  //   _maybeNavigate('didChangeDependencies');
  // }

  void _maybeNavigate() {
    if (!_canNavigate || _bufferedState == null) return;

    print(
      '~ ${_bufferedState?.when(initial: () => 'initial', notIntroduced: () => 'notIntroduced', introduced: () => 'introduced')}',
    );
    _bufferedState!.whenOrNull(
      notIntroduced: () {
        _canNavigate = false;

        GetAppNavigator.entryNavigator().navigateOnboardingPage(context);
      },
      introduced: () {
        _canNavigate = false;
        GetAppNavigator.entryNavigator().navigateOnboardingPage(context);
        // GetAppNavigator.mainNavigator().navigateToMainPage(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EntryCubit, EntryState>(
          bloc: context.read<EntryCubit>(),
          listener: (context, state) {
            _bufferedState = state;
            _maybeNavigate();
          },
        ),
      ],
      child: BlocBuilder<PopHandlerCubit, PopHandlerState>(
        builder: (context, state) {
          return PopScope(
            canPop: state.maybeWhen(popRoute: () => true, orElse: () => false),
            onPopInvokedWithResult: (didPop, _) {
              print('>>>> object: didPop: $didPop | canPop: ');
              if (!didPop) {
                context.read<PopHandlerCubit>().handle();
              }
            },
            child: Scaffold(
              backgroundColor: AppColor.primaryBlue.shade500,
              body: SafeArea(
                child: Padding(
                  padding: REdgeInsets.all(16),
                  child: Center(
                    child: DownToUp(
                      delayFactor: 1,
                      withPosition: false,
                      child: [
                        AppAsset.icPillMindPng.displayImage(width: 200.w),
                        32.verticalSpace,
                        Text(
                          'Pill Mind',
                          style: theme.textTheme.displayLarge?.modifier(
                            fontWeight: AppFontWeight.regular,
                          ),
                        ),
                      ].column(mainAxisSize: MainAxisSize.min),
                      onFinish: () {
                        Future.delayed(const Duration(milliseconds: 200), () {
                          _canNavigate = true;
                          _maybeNavigate();
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }
}
