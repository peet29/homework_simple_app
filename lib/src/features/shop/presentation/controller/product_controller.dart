import 'package:homework_simple_app/src/features/shop/application/shop_service.dart';
import 'package:homework_simple_app/src/features/shop/presentation/state/product_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_controller.g.dart';

@Riverpod(keepAlive: true)
class ProductController extends _$ProductController {
  @override
  ProductState build() {
    return const ProductState();
  }

  Future<void> getProducts(String category) async {
    state = state.copyWith(products: const AsyncValue.loading());

    final result = await ref.watch(shopServiceProvider).getProducts(category);

    result.when(
      (value) {
        state = state.copyWith(products: AsyncValue.data(value));
      },
      (failure) {
        state = state.copyWith(
            products: AsyncValue.error(failure, StackTrace.current));
      },
    );
  }
}
