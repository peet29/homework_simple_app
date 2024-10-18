import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_simple_app/src/core/route/route_name.dart';
import 'package:homework_simple_app/src/features/shop/presentation/home_screen.dart';
import 'package:homework_simple_app/src/features/shop/presentation/product_screen.dart';

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
          return const MaterialPage(child: HomeScreen());
        },
      ),
      GoRoute(
        name: productList,
        path: '/$productList/:category',
        pageBuilder: (BuildContext context, GoRouterState state) {
          final category = state.pathParameters['category'] ?? '';
          return MaterialPage(
              child: ProductScreen(
            category: category,
          ));
        },
      ),
    ],
  );
}
