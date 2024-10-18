import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homework_simple_app/src/features/shop/domain/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(AsyncLoading()) final AsyncValue<List<ProductModel>> products,
  }) = _ProductState;
}
