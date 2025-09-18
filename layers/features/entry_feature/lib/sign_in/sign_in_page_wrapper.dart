// @RoutePage(name: 'HumoRouter')
// class HumoPayPageWrapper extends AutoRouter implements AutoRouteWrapper {
//   const HumoPayPageWrapper();
//
//   @override
//   Widget wrappedRoute(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => AppBlocHelper.getHumoCardController(),
//         ),
//         BlocProvider(
//           create: (context) => AppBlocHelper.getHumoPayAuthCubit(),
//         ),
//         BlocProvider(
//           create: (context) => AppBlocHelper.getHumoPayCardCubit(
//             context.read<HumoPayCardController>(),
//           ),
//         ),
//         BlocProvider(
//           create: (context) => AppBlocHelper.getHumoPayWalletCubit(),
//         ),
//       ],
//       child: this,
//     );
//   }
// }