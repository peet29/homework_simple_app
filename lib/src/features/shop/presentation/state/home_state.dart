import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homework_simple_app/src/features/shop/domain/category_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(AsyncLoading()) AsyncValue<List<CategoryModel>> categories,
  }) = _HomeState;
}
