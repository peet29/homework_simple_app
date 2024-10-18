import 'package:homework_simple_app/src/features/shop/application/shop_service.dart';
import 'package:homework_simple_app/src/features/shop/presentation/state/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeController extends _$HomeController {
  @override
  HomeState build() {
    return const HomeState();
  }

  Future<void> getCategories() async {
    state = state.copyWith(categories: const AsyncValue.loading());

    final result = await ref.watch(shopServiceProvider).getCategories();

    result.when(
      (categories) {
        state = state.copyWith(categories: AsyncValue.data(categories));
      },
      (failure) {
        state = state.copyWith(
            categories: AsyncValue.error(failure, StackTrace.current));
      },
    );
  }
}
