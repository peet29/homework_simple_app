import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:homework_simple_app/src/core/route/route_name.dart';
import 'package:homework_simple_app/src/core/route/route_provider.dart';
import 'package:homework_simple_app/src/features/shop/presentation/controller/home_controller.dart';
import 'package:homework_simple_app/src/features/shop/presentation/widgets/shop_drawer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeControllerProvider.notifier).getCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categories =
        ref.watch(homeControllerProvider.select((state) => state.categories));

    return Scaffold(
      drawer: const ShopDrawer(),
      appBar: AppBar(
        leading: const DrawerButton(),
        backgroundColor: Colors.green.shade300,
        centerTitle: false,
        title: Text(context.tr('home.title')),
      ),
      body: categories.when(data: (data) {
        return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].name),
                onTap: () {
                  context.pushNamed(productList,
                      pathParameters: {'category': data[index].slug});
                },
              );
            });
      }, error: (error, st) {
        return const Center(child: Text('Something went wrong'));
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
