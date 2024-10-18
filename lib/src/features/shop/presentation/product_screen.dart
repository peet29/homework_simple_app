import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homework_simple_app/src/features/shop/presentation/controller/product_controller.dart';
import 'package:homework_simple_app/src/features/shop/presentation/widgets/shop_drawer.dart';

class ProductScreen extends ConsumerStatefulWidget {
  final String category;
  const ProductScreen({required this.category, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(productControllerProvider.notifier).getProducts(widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    final products =
        ref.watch(productControllerProvider.select((state) => state.products));
    return Scaffold(
      drawer: const ShopDrawer(),
      appBar: AppBar(
        leading: const DrawerButton(),
        backgroundColor: Colors.green.shade300,
        centerTitle: false,
        title: Text(context.tr('product.title')),
      ),
      body: products.when(data: (data) {
        return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(data[index].thumbnail),
                title: Text(data[index].title),
                subtitle: Text(data[index].description),
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
