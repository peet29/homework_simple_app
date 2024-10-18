import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ShopDrawer extends ConsumerWidget {
  const ShopDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                context.setLocale(const Locale('th', 'TH'));
                context.pop();
              },
              title: Text(context.tr('drawer.thai')),
            ),
            ListTile(
              onTap: () {
                context.setLocale(const Locale('en', 'US'));
                context.pop();
              },
              title: Text(context.tr('drawer.english')),
            )
          ],
        ),
      ),
    );
  }
}
