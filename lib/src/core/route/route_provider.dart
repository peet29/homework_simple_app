import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_simple_app/src/core/route/route_name.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'route_provider.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey(debugLabel: 'root');

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        name: homeRoute,
        path: '/',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: Text('home'));
        },
      ),
      GoRoute(
        name: productList,
        path: '/$productList/:productId',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: Text('product'));
        },
      ),
    ],
  );
}
