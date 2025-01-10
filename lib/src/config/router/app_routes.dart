import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_data_sender/src/presentation/pages/main/home/home_page.dart';

part 'name_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

final Chuck chuck = Chuck(navigatorKey: rootNavigatorKey);

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.initial,
  errorBuilder: (_, state) => Scaffold(
    body: Center(
      child: Text('${state.error}'),
    ),
  ),
  routes: <RouteBase>[
    /// splash
    GoRoute(
      path: Routes.initial,
      name: Routes.initial,
      builder: (_, __) => const HomePage(),
    ),
  ],
);
